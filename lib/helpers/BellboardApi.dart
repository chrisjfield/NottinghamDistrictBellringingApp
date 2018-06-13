import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:xml/xml.dart';

import '../models/PerformanceDetail.dart';
import '../settings/TowerList.dart';
import 'UrlHelper.dart';

class BellboardApi {
  static const String _baseURL = 'https://bb.ringingworld.co.uk/export.php';

  Future<List<PerformanceDetail>> fetchPerformancesPage(int pageNumber) async {
    final String searchString = TowerList.towerList.fold('', (prev, tower) {
      return prev.isEmpty ? 'place=${tower.place}' : '$prev|${tower.place}';
    });

    final String url = UrlHelper.parse(
      '$_baseURL?fmt=xml&$searchString&pagesize=10&page=${pageNumber.toString()}',
    );

    final Map<String, String> headers = Map<String, String>();
    headers['Cache-Control'] = 'no-cache, must-revalidate, max-age=3600';

    final Response response = await get(url, headers: headers);
    final List<PerformanceDetail> performances =
        _convertResponseToPerformanceList(response);

    return performances;
  }

  List<PerformanceDetail> _convertResponseToPerformanceList(
      Response apiResponse) {
    String returnXml = utf8.decode(apiResponse.bodyBytes);
    XmlDocument document = parse(returnXml);
    final List<PerformanceDetail> performances = List<PerformanceDetail>();

    Iterable<XmlElement> performancesXml =
        document.findElements('performances').first.findElements('performance');

    performancesXml.forEach(
        (element) => performances.add(_getPerformanceFromXML(element)));

    return performances;
  }

  PerformanceDetail _getPerformanceFromXML(XmlElement element) {
    final String place = _getXMLNodeByNameAndAttributeValue(
        element, "place-name", "type", "place");
    final String dedication = _getXMLNodeByNameAndAttributeValue(
        element, "place-name", "type", "dedication");

    return PerformanceDetail(
      bellboardId: _getXMLElementAttribute(element, "id"),
      association: _getXMLNodeValue(element, "association"),
      changes: _getXMLNodeValue(element, "changes"),
      date: _getXMLNodeValue(element, "date"),
      duration: _getXMLNodeValue(element, "duration"),
      footnote: _getXMLNodeValue(element, "footnote"),
      method: _getXMLNodeValue(element, "method"),
      place: '$place $dedication',
      ringers: _getRingers(element),
    );
  }

  String _getRinger(XmlElement element) {
    String bell = _getXMLElementAttribute(element, "bell");
    String conductor = _getXMLElementAttribute(element, "conductor");
    String ringerName = element.text;
    if (conductor.isNotEmpty) {
      ringerName += " (C)";
    }

    return "$bell: $ringerName";
  }

  List<String> _getRingers(XmlElement element) {
    List<String> ringers = List<String>();
    element
        .findAllElements("ringer")
        .forEach((ringer) => ringers.add(_getRinger(ringer)));

    return ringers;
  }

  String _getXMLElementAttribute(XmlElement element, String elementName) {
    XmlAttribute blankAttribute =
        XmlAttribute(XmlName("AttributeNotFound"), "");

    XmlAttribute attribute = element.attributes.firstWhere(
        (attribute) => attribute.name.toString() == elementName,
        orElse: () => blankAttribute);

    return attribute.value;
  }

  String _getXMLNodeByNameAndAttributeValue(XmlElement element, String nodeName,
      String attributeName, String attributeValue) {
    String combinedResult = element
        .findAllElements(nodeName)
        .where((node) =>
            node.name.toString() == nodeName &&
            _getXMLElementAttribute(node, attributeName) == attributeValue)
        .fold("", (prev, node) => prev + node.text + "\n");

    return combinedResult.trimRight();
  }

  String _getXMLNodeValue(XmlElement element, String nodeName) {
    String combinedResult = element
        .findAllElements(nodeName)
        .where((node) => node.name.toString() == nodeName)
        .fold("", (prev, node) => prev + node.text + "\n");

    return combinedResult.trimRight();
  }
}

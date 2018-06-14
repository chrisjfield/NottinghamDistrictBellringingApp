import 'dart:convert';

import 'package:http/http.dart';
import 'package:xml/xml.dart';

import '../models/PerformanceDetail.dart';

class XmlHelper {
  static List<PerformanceDetail> convertResponseToPerformanceList(
      Response apiResponse) {
    final List<PerformanceDetail> performances = List<PerformanceDetail>();

    final String returnXml = utf8.decode(apiResponse.bodyBytes);
    final XmlDocument document = parse(returnXml);

    final Iterable<XmlElement> performancesXml =
        document.findElements('performances').first.findElements('performance');

    performancesXml.forEach((element) => performances.add(
          _getPerformanceFromXML(element),
        ));

    return performances;
  }

  static PerformanceDetail _getPerformanceFromXML(XmlElement element) {
    final String place = _getXMLNodeByNameAndAttributeValue(
        element, 'place-name', 'type', 'place');
    final String dedication = _getXMLNodeByNameAndAttributeValue(
        element, 'place-name', 'type', 'dedication');

    return PerformanceDetail(
      bellboardId: _getXMLElementAttribute(element, 'id'),
      association: _getXMLNodeValue(element, 'association'),
      changes: _getXMLNodeValue(element, 'changes'),
      date: _getXMLNodeValue(element, 'date'),
      duration: _getXMLNodeValue(element, 'duration'),
      footnote: _getXMLNodeValue(element, 'footnote'),
      method: _getXMLNodeValue(element, 'method'),
      place: '$place, $dedication',
      ringers: _getRingers(element),
    );
  }

  static String _getRinger(XmlElement element) {
    final String bell = _getXMLElementAttribute(element, 'bell');
    final String conductor = _getXMLElementAttribute(element, 'conductor');

    String ringerName = element.text;

    if (conductor.isNotEmpty) {
      ringerName += ' (C)';
    }

    return '$bell: $ringerName';
  }

  static List<String> _getRingers(XmlElement element) {
    List<String> ringers = List<String>();

    element.findAllElements('ringer').forEach((ringer) => ringers.add(
          _getRinger(ringer),
        ));

    return ringers;
  }

  static String _getXMLElementAttribute(
      XmlElement element, String elementName) {
    final XmlAttribute blankAttribute =
        XmlAttribute(XmlName('AttributeNotFound'), '');

    final XmlAttribute attribute = element.attributes.firstWhere(
        (attribute) => attribute.name.toString() == elementName,
        orElse: () => blankAttribute);

    return attribute.value;
  }

  static String _getXMLNodeByNameAndAttributeValue(XmlElement element,
      String nodeName, String attributeName, String attributeValue) {
    final String combinedResult = element
        .findAllElements(nodeName)
        .where((node) =>
            node.name.toString() == nodeName &&
            _getXMLElementAttribute(node, attributeName) == attributeValue)
        .fold('', (prev, node) => prev + node.text + '\n');

    return combinedResult.trimRight();
  }

  static String _getXMLNodeValue(XmlElement element, String nodeName) {
    String combinedResult = element
        .findAllElements(nodeName)
        .where((node) => node.name.toString() == nodeName)
        .fold('', (prev, node) => prev + node.text + '\n');

    return combinedResult.trimRight();
  }
}

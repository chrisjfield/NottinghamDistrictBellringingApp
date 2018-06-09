import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;

import '../pageLayout/PageScaffold.dart';
import '../models/PerformanceDetail.dart';

class Performances extends StatelessWidget {
  Future<http.Response> fetchPerformances() async {
    final response = await http.get(
        'https://bb.ringingworld.co.uk/export.php?fmt=xml&place=Beeston|Nottingham&pagesize=10&page=1');

    String string = utf8.decode(response.bodyBytes);
    xml.XmlDocument document = xml.parse(string);
    Iterable<xml.XmlElement> performancesXml =
        document.findElements('performances').first.findElements('performance');

    List<PerformanceDetail> performances = List<PerformanceDetail>();

    performancesXml.forEach(
        (element) => performances.add(_getPerformanceFromXML(element)));

    return response;
  }

  PerformanceDetail _getPerformanceFromXML(xml.XmlElement element) {
    return PerformanceDetail(
        bellboardId: _getXMLElementAttribute(element, "id"),
        association: _getXMLNodeValue(element, "association"),
        changes: _getXMLNodeValue(element, "changes"),
        date: _getXMLNodeValue(element, "date"),
        duration: _getXMLNodeValue(element, "duration"),
        footnote: _getXMLNodeValue(element, "footnote"),
        method: _getXMLNodeValue(element, "method"),
        place: _getXMLNodeValue(element, "place-name"),
        ringers: _getRingers(element));
  }

  List<String> _getRingers(xml.XmlElement element) {
    List<String> ringers = List<String>();
    element
        .findAllElements("ringer")
        .forEach((ringer) => ringers.add(_getRinger(ringer)));

    return ringers;
  }

  String _getRinger(xml.XmlElement element) {
    String bell = _getXMLElementAttribute(element, "bell");
    String conductor = _getXMLElementAttribute(element, "conductor");
    String ringerName = element.text;
    if (conductor.isNotEmpty) {
      ringerName += " (C)";
    }

    return "$bell: $ringerName";
  }

  String _getXMLNodeValue(xml.XmlElement element, String nodeName) {
    String combinedResult = element
        .findAllElements(nodeName)
        .where((node) => node.name.toString() == nodeName)
        .fold("", (prev, node) => prev + node.text + "\n");

    return combinedResult.trimRight();
  }

  String _getXMLElementAttribute(xml.XmlElement element, String elementName) {
    xml.XmlAttribute blankAttribute =
        xml.XmlAttribute(xml.XmlName("AttributeNotFound"), "");

    xml.XmlAttribute attribute = element.attributes.firstWhere(
        (attribute) => attribute.name.toString() == elementName,
        orElse: () => blankAttribute);

    return attribute.value;
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      titleText: 'Performances',
      child: FutureBuilder<http.Response>(
        future: fetchPerformances(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new Text("it worked");
          } else if (snapshot.hasError) {
            return new Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return new CircularProgressIndicator();
        },
      ),
    );
  }
}

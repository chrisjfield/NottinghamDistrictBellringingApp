import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;

import '../pageLayout/PageScaffold.dart';
import '../models/PerformanceDetail.dart';
import 'PerformanceDetails.dart';

class Performances extends StatefulWidget {
  @override
  PerformancesState createState() => PerformancesState();
}

class PerformancesState extends State<StatefulWidget> {
  final List<PerformanceDetail> _performances = List<PerformanceDetail>();
  int _pageNumber = 1;

  void fetchPerformances() async {
    final response = await http.get(
        "https://bb.ringingworld.co.uk/export.php?fmt=xml&place=Beeston|Nottingham&pagesize=10&page=${_pageNumber.toString()}");

    String string = utf8.decode(response.bodyBytes);
    xml.XmlDocument document = xml.parse(string);
    Iterable<xml.XmlElement> performancesXml =
        document.findElements('performances').first.findElements('performance');

    performancesXml.forEach((element) => setState(() {
          _performances.add(_getPerformanceFromXML(element));
        }));

    setState(() {
      _pageNumber += 1;
    });
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
      place: _getXMLNodeByNameAndAttributeValue(
              element, "place-name", "type", "place") +
          " " +
          _getXMLNodeByNameAndAttributeValue(
              element, "place-name", "type", "dedication"),
      ringers: _getRingers(element),
    );
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

  String _getXMLNodeByNameAndAttributeValue(xml.XmlElement element,
      String nodeName, String attributeName, String attributeValue) {
    String combinedResult = element
        .findAllElements(nodeName)
        .where((node) =>
            node.name.toString() == nodeName &&
            _getXMLElementAttribute(node, attributeName) == attributeValue)
        .fold("", (prev, node) => prev + node.text + "\n");

    return combinedResult.trimRight();
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

  _getPerformaceWidget() {
    if (_pageNumber == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          )
        ],
      );
    } else if (_performances.length == 0) {
      return Text("No performaces to show");
    } else {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(_performances[index].place),
              subtitle: Text(_performances[index].changes +
                  " " +
                  _performances[index].method),
              leading: Text(
                DateFormat
                    .MMMd("en_US")
                    .format(DateTime.parse(_performances[index].date)),
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PerformanceDetails(
                          key: Key("performance1"),
                          performanceDetails: _performances[index],
                        ),
                  ),
                );
              },
            ),
        itemCount: _performances.length,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_pageNumber == 1) {
      fetchPerformances();
    }

    return PageScaffold(
      titleText: 'Performances',
      child: _getPerformaceWidget(),
    );
  }
}

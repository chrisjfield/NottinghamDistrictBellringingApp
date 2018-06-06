import 'package:flutter/material.dart';
import 'pages/Towers.dart';
import 'pages/Home.dart';

class NottinghamDistrictApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      "Page": (BuildContext context) => Towers(),
    };

    return new MaterialApp(
      title: 'Nottingham District',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      routes: routes,
    );
  }
}

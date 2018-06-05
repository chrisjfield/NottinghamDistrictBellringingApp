import 'package:flutter/material.dart';
import './pageLayout/PageScaffold.dart';

void main() => runApp(new MyApp());

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
        titleText: 'Towers',
        child: Center(
            child: Text(
          'hello world',
        )));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      "Page": (BuildContext context) => Page(),
    };

    return new MaterialApp(
      title: 'Nottingham District Bellringing',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: routes,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      titleText: 'home',
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'home',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}

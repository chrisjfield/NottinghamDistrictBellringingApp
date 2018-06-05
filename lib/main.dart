import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'hello world',
    ));
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
    return new Scaffold(
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: Image(
                image: AssetImage('images/SouthallMinster.jpg'),
                fit: BoxFit.cover,
              ),
              padding: EdgeInsets.zero,
            ),
            new ListTile(
              leading: const Icon(Icons.home),
              title: new Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            new Divider(),
            new ListTile(
              leading: const Icon(Icons.location_city),
              title: new Text('Towers'),
              onTap: () {
                Navigator.pushNamed(context, "Page");
              },
            ),
            new Divider(),
            new ListTile(
              leading: const Icon(Icons.notifications),
              title: new Text('Performances'),
              onTap: () {},
            ),
            new Divider(),
            new ListTile(
              leading: const Icon(Icons.event),
              title: new Text('Events'),
              onTap: () {},
            ),
            new Divider(),
          ],
        ),
      ),
      appBar: new AppBar(
        title: new Text('home'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
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

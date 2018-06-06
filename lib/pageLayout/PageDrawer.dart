import 'package:flutter/material.dart';

class PageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Image(
              image: AssetImage('images/SouthallMinster.jpg'),
              fit: BoxFit.cover,
            ),
            padding: EdgeInsets.zero,
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/');
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: Text('Towers'),
            onTap: () {
              Navigator.popAndPushNamed(context, "Page");
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: Text('Performances'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.event),
            title: Text('Events'),
            onTap: () {},
          ),
          Divider(),
        ],
      ),
    );
  }
}

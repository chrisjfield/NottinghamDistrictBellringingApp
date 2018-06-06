import 'package:flutter/material.dart';
import '../routes/RoutesEnum.dart';

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
              Navigator.popAndPushNamed(context, RoutesEnum.home);
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: Text('Towers'),
            onTap: () {
              Navigator.popAndPushNamed(context, RoutesEnum.towers);
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: Text('Performances'),
            onTap: () {
              Navigator.popAndPushNamed(context, RoutesEnum.performances);
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.event),
            title: Text('Events'),
            onTap: () {
              Navigator.popAndPushNamed(context, RoutesEnum.events);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../routes/Routes.dart';

class PageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: ListView(
          children: _getDrawerOptions(context),
        ),
      ),
    );
  }

  DrawerHeader _getDrawerHeader() {
    return DrawerHeader(
      child: Image(
        image: AssetImage('images/core/District_Main_Tower.jpg'),
        fit: BoxFit.cover,
      ),
      padding: EdgeInsets.zero,
    );
  }

  List<Widget> _getDrawerOptions(BuildContext context) {
    final List<Widget> options = [];

    options.add(_getDrawerHeader());

    options.addAll(_getMenuOption(
      context,
      'Home',
      Icons.home,
      RoutesEnum.home,
    ));
    options.addAll(_getMenuOption(
      context,
      'Towers',
      Icons.location_city,
      RoutesEnum.towers,
    ));
    options.addAll(_getMenuOption(
      context,
      'Performances',
      Icons.music_note,
      RoutesEnum.performances,
    ));
    options.addAll(_getMenuOption(
      context,
      'Events',
      Icons.event,
      RoutesEnum.events,
    ));

    return options;
  }

  List<Widget> _getMenuOption(
    BuildContext context,
    String title,
    IconData icon,
    String route,
  ) {
    return [
      ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () {
          Navigator.popAndPushNamed(context, route);
        },
      ),
      Divider(),
    ];
  }
}

import 'package:flutter/material.dart';

import '../../models/TowerDetail.dart';
import '../../pageLayout/PageScaffold.dart';
import '../../settings/TowerList.dart';
import 'TowerDetails.dart';

class Towers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      titleText: 'Towers',
      child: _getTowerList(),
    );
  }

  ListTile _getListItem(BuildContext context, int index) {
    TowerDetail tower = TowerList.towerList[index];
    String title = '${tower.place}, ${tower.dedication}';

    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).accentColor,
        child: Text(
          tower.numberOfBells,
          style: TextStyle(color: Theme.of(context).primaryColorDark),
        ),
      ),
      onTap: () => _navigateToDetailPage(context, tower),
    );
  }

  Widget _getTowerList() {
    return ListView.builder(
      itemCount: TowerList.towerList.length,
      itemBuilder: (BuildContext context, int index) =>
          _getListItem(context, index),
    );
  }

  void _navigateToDetailPage(BuildContext context, TowerDetail tower) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TowerDetails(towerDetails: tower),
      ),
    );
  }
}

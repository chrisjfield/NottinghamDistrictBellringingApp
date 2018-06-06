import 'package:flutter/material.dart';
import '../pageLayout/PageScaffold.dart';
import '../models/TowerDetail.dart';
import 'TowerDetails.dart';

class Towers extends StatelessWidget {
  final List<TowerDetail> towerList = [
    TowerDetail(
      imageLocation: "images/NottinghamAllSaints.jpg",
      name: "Nottingham All Saints",
    ),
    TowerDetail(
      imageLocation: "images/NottinghamStPeters.jpg",
      name: "Nottingham St Peters",
    ),
  ];

  Widget _getTowerList(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Center(child: Text('Nottingham All Saints')),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    TowerDetails(towerDetails: 'Nottingham All Saints'),
              ),
            );
          },
        ),
        Divider(),
        ListTile(
          title: Center(child: Text('Nottingham St Peters')),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    TowerDetails(towerDetails: 'Nottingham St Peters'),
              ),
            );
          },
        ),
        Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //Widget a = _getTowerList(context);

    return PageScaffold(
      titleText: 'Towers',
      child: _getTowerList(context),
    );
  }
}

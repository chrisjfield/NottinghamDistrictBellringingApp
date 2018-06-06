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
      children: towerList
          .map((TowerDetail towerDetail) => ListTile(
                title: Center(child: Text(towerDetail.name)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TowerDetails(
                            key: Key("tower1"),
                            towerDetails: towerDetail,
                          ),
                    ),
                  );
                },
              ))
          .toList(),
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

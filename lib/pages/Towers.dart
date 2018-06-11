import 'package:flutter/material.dart';
import '../pageLayout/PageScaffold.dart';
import '../models/TowerDetail.dart';
import '../settings/TowerList.dart';
import 'TowerDetails.dart';

class Towers extends StatelessWidget {
  Widget _getTowerList(BuildContext context) {
    return ListView(
      children: TowerList.towerList
          .map((TowerDetail towerDetail) => ListTile(
                title: Text(towerDetail.place + ", " + towerDetail.dedication),
                leading: Text(towerDetail.numberOfBells),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TowerDetails(
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
    return PageScaffold(
      titleText: 'Towers',
      child: _getTowerList(context),
    );
  }
}

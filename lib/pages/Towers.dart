import 'package:flutter/material.dart';
import '../pageLayout/PageScaffold.dart';
import '../models/TowerDetail.dart';
import 'TowerDetails.dart';

class Towers extends StatelessWidget {
  final List<TowerDetail> towerList = [
    TowerDetail(
      imageLocation: "images/NottinghamAllSaints.jpg",
      name: "Nottingham All Saints",
      email: "master@nuscr.org",
      phoneNumber: "07446388494",
      doveID: "NOTTINGM+A",
      numberOfBells: "8",
      postcode: "NG7 4DL",
      practiseTime: "Tue 19:00-20:30",
      serviceTime: "Sun 10:00-10:30",
      weight: "16-1-3",
    ),
    TowerDetail(
      imageLocation: "images/NottinghamStPeters.jpg",
      name: "Nottingham St Peters",
      email: "nottingham_st_peter@southwelldg.org.uk",
      phoneNumber: "07446388494",
      doveID: "NOTTINGM+P",
      numberOfBells: "12",
      postcode: "NG1 7DA",
      practiseTime: "Thu 19:45-21:00",
      serviceTime: "Sun 16:00-17:00",
      weight: "22-2-5",
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
    return PageScaffold(
      titleText: 'Towers',
      child: _getTowerList(context),
    );
  }
}

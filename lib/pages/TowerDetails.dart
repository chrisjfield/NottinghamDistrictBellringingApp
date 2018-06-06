import 'package:flutter/material.dart';
import '../pageLayout/DetailPageScaffold.dart';
//import '../models/TowerDetail.dart';

class TowerDetails extends StatelessWidget {
  final String towerDetails;

  TowerDetails({@required this.towerDetails});

  Widget _getTowerDetails() {
    return Center(
      child: Text(towerDetails),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DetailPageScaffold(
      titleText: towerDetails,
      child: _getTowerDetails(),
    );
  }
}

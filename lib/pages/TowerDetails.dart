import 'package:flutter/material.dart';
import '../pageLayout/DetailPageScaffold.dart';
import '../models/TowerDetail.dart';

class TowerDetails extends StatelessWidget {
  final TowerDetail towerDetails;

  TowerDetails({Key key, @required this.towerDetails}) : super(key: key);

  Widget _getTowerDetails() {
    return Center(
      child: Text(towerDetails.name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DetailPageScaffold(
      titleText: towerDetails.name,
      child: _getTowerDetails(),
    );
  }
}

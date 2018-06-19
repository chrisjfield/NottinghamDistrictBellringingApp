import 'package:flutter/material.dart';

import '../../helpers/TextHelper.dart';
import '../../helpers/ButtonHelper.dart';
import '../../models/TowerDetail.dart';
import '../../pageLayout/DetailPageScaffold.dart';

class TowerDetails extends StatelessWidget {
  final TowerDetail towerDetails;

  TowerDetails({Key key, @required this.towerDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailPageScaffold(
      titleText: "Tower Details",
      child: _getTowerDetails(context, towerDetails),
    );
  }

  List<Widget> _getButtons(BuildContext context, TowerDetail towerDetails) {
    final List<Widget> buttons = [];

    if (towerDetails.phoneNumber?.isNotEmpty ?? false) {
      buttons.add(ButtonHelper.createButton(
        context,
        'CALL',
        Icons.call,
        'tel: ${towerDetails.phoneNumber}',
        false,
      ));
    }

    if (towerDetails.email?.isNotEmpty ?? false) {
      buttons.add(ButtonHelper.createButton(
        context,
        'EMAIL',
        Icons.email,
        'mailto: ${towerDetails.email}?subject=Bellinging at ${towerDetails.place}',
        false,
      ));
    }

    buttons.add(
      ButtonHelper.createButton(
        context,
        'ROUTE',
        Icons.near_me,
        'https://www.google.com/maps/search/?api=1&query=${towerDetails.postcode}',
        true,
      ),
    );

    buttons.add(
      ButtonHelper.createButton(
        context,
        'DOVE',
        Icons.notifications,
        'https://dove.cccbr.org.uk/detail.php?DoveID=${towerDetails.doveID}',
        true,
      ),
    );

    return buttons;
  }

  Widget _getButtonSection(BuildContext context, TowerDetail towerDetails) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _getButtons(context, towerDetails),
      ),
    );
  }

  Widget _getDetailsSection(TowerDetail towerDetails) {
    String towerContact =
        towerDetails.contactName != null ? towerDetails.contactName : '';

    String practiseTime = TextHelper.isNullOrEmpty(towerDetails.practiseTime)
        ? 'Please check, no regular practise'
        : towerDetails.practiseTime;

    String serviceTime = TextHelper.isNullOrEmpty(towerDetails.serviceTime)
        ? 'Please check, no regular ringing'
        : towerDetails.serviceTime;

    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextHelper.textRowHeading(text: 'Tower Details', topPadding: 5.0),
          TextHelper.multipleTextRowLeftAlign(textList: [
            'Bells: ${towerDetails.numberOfBells}',
            'Weight: ${towerDetails.weight}',
          ], topPadding: 10.0, leftPadding: 80.0, rightPadding: 40.0),
          TextHelper.textRowLeftAlign(
              text: 'Contact: $towerContact',
              topPadding: 5.0,
              leftPadding: 80.0),
          TextHelper.textRowHeading(text: 'Ringing Details', topPadding: 20.0),
          TextHelper.textRowLeftAlign(
              text: 'Practise: $practiseTime',
              topPadding: 10.0,
              leftPadding: 80.0),
          TextHelper.textRowLeftAlign(
              text: 'Service: $serviceTime',
              topPadding: 5.0,
              leftPadding: 80.0),
        ],
      ),
    );
  }

  Widget _getTowerDetails(BuildContext context, TowerDetail towerDetails) {
    return ListView(
      children: [
        Image.asset(
          towerDetails.imageLocation,
          height: 240.0,
          fit: BoxFit.cover,
        ),
        _getButtonSection(context, towerDetails),
        _getDetailsSection(towerDetails),
      ],
    );
  }
}

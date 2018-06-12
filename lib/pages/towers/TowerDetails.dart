import 'package:flutter/material.dart';

import '../../helpers/UrlHelper.dart';
import '../../models/TowerDetail.dart';
import '../../pageLayout/DetailPageScaffold.dart';

class TowerDetails extends StatelessWidget {
  final TowerDetail towerDetails;

  TowerDetails({Key key, @required this.towerDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailPageScaffold(
      titleText: towerDetails.place,
      child: _getTowerDetails(context, towerDetails),
    );
  }

  Column _createButton(
      BuildContext context, String buttonText, IconData icon, String url) {
    Color color = Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: color,
          ),
          onPressed: () => UrlHelper.launchURL(url),
        ),
        Container(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _getButtons(BuildContext context, TowerDetail towerDetails) {
    final List<Widget> buttons = List<Widget>();

    if (towerDetails.phoneNumber?.isNotEmpty ?? false) {
      buttons.add(_createButton(
          context, 'CALL', Icons.call, 'tel: ${towerDetails.phoneNumber}'));
    }

    if (towerDetails.email?.isNotEmpty ?? false) {
      buttons.add(_createButton(context, 'EMAIL', Icons.email,
          'mailto: ${towerDetails.email}?subject=Bellinging at ${towerDetails.place}'));
    }

    buttons.add(_createButton(
      context,
      'ROUTE',
      Icons.near_me,
      UrlHelper.parse(
          'https://www.google.com/maps/search/?api=1&query=${towerDetails.postcode}'),
    ));

    buttons.add(_createButton(
      context,
      'DOVE',
      Icons.notifications,
      UrlHelper.parse(
          'https://dove.cccbr.org.uk/detail.php?DoveID=${towerDetails.doveID}'),
    ));

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

    String practiseTime = (towerDetails.practiseTime != null &&
            towerDetails.practiseTime.isNotEmpty)
        ? towerDetails.practiseTime
        : "Please check, no regular practise";

    String serviceTime = (towerDetails.serviceTime != null &&
            towerDetails.serviceTime.isNotEmpty)
        ? towerDetails.serviceTime
        : "Please check, no regular ringing";

    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getSectionHeader('Tower Details', 5.0),
          _getSectionRow([
            Text('Bells: ${towerDetails.numberOfBells}'),
            Text('Weight: ${towerDetails.weight}')
          ], 10.0),
          _getSectionRow([
            Text('Contact: $towerContact'),
          ], 5.0),
          _getSectionHeader('Ringing Details', 20.0),
          _getSectionRow([
            Text('Practise: $practiseTime'),
          ], 10.0),
          _getSectionRow([
            Text('Service: $serviceTime'),
          ], 5.0),
        ],
      ),
    );
  }

  Widget _getSectionHeader(String sectionName, double topPadding) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: topPadding, left: 40.0),
          child: Text(
            sectionName,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getSectionRow(List<Widget> children, double topPadding) {
    return Padding(
      padding: EdgeInsets.only(left: 80.0, top: topPadding),
      child: Row(
        children: children.map((child) {
          return Expanded(
            child: child,
          );
        }).toList(),
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

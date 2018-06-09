import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pageLayout/DetailPageScaffold.dart';
import '../models/TowerDetail.dart';

class TowerDetails extends StatelessWidget {
  final TowerDetail towerDetails;

  TowerDetails({Key key, @required this.towerDetails}) : super(key: key);

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _getButtonSection(BuildContext context, TowerDetail towerDetails) {
    Color color = Theme.of(context).primaryColor;

    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.call,
                  color: color,
                ),
                onPressed: () => _launchURL("tel:" + towerDetails.phoneNumber),
              ),
              Container(
                child: Text(
                  'CALL',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.email,
                  color: color,
                ),
                onPressed: () => _launchURL("mailto:" +
                    towerDetails.email +
                    "?subject=Bellinging at " +
                    towerDetails.name),
              ),
              Container(
                child: Text(
                  'EMAIL',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.near_me,
                  color: color,
                ),
                onPressed: () => _launchURL(
                    "https://www.google.com/maps/search/?api=1&query=" +
                        towerDetails.postcode),
              ),
              Container(
                child: Text(
                  'ROUTE',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: color,
                ),
                onPressed: () => _launchURL(
                    "http://dove.cccbr.org.uk/detail.php?DoveID=" +
                        towerDetails.doveID),
              ),
              Container(
                child: Text(
                  'DOVE',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getDetailsSection(TowerDetail towerDetails) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 40.0),
              ),
              Text(
                'Tower Details',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 80.0),
              ),
              Expanded(
                child: Text("Bells: " + towerDetails.numberOfBells),
              ),
              Expanded(
                child: Text("Weight: " + towerDetails.weight),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 40.0),
              ),
              Text(
                'Ringing Details',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 80.0),
              ),
              Column(
                children: [
                  Text("Practise: " + towerDetails.practiseTime),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Text("Service: " + towerDetails.serviceTime),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          )
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

  @override
  Widget build(BuildContext context) {
    return DetailPageScaffold(
      titleText: towerDetails.name,
      child: _getTowerDetails(context, towerDetails),
    );
  }
}

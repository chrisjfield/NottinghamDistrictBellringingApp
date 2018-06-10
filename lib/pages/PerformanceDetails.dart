import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pageLayout/DetailPageScaffold.dart';
import '../models/PerformanceDetail.dart';

class PerformanceDetails extends StatelessWidget {
  final PerformanceDetail performanceDetails;

  PerformanceDetails({Key key, @required this.performanceDetails})
      : super(key: key);

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DetailPageScaffold(
      titleText: "Details",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(performanceDetails.association),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Text(performanceDetails.date),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Text(performanceDetails.changes),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Text(performanceDetails.duration),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Text(performanceDetails.method),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Text(performanceDetails.place),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Text(performanceDetails.ringers
                  .fold("", (prev, ringer) => prev + ringer + "\n")
                  .trimRight()),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Container(
                child: Text(
                  performanceDetails.footnote,
                ),
                width: 200.0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              RaisedButton(
                onPressed: () {
                  _launchURL("https://bb.ringingworld.co.uk/view.php?id=" +
                      performanceDetails.bellboardId);
                },
                child: Text("Go to Bellboard"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
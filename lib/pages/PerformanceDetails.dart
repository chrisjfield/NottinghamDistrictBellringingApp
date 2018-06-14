import 'package:flutter/material.dart';

import '../DistrictRingingApp.dart';
import '../pageLayout/DetailPageScaffold.dart';
import '../models/PerformanceDetail.dart';

class PerformanceDetails extends StatelessWidget {
  final PerformanceDetail performanceDetails;

  PerformanceDetails({Key key, @required this.performanceDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bbApi = DistrictInheritedWidget.of(context).bbApi;

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
              Text(performanceDetails.place),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Row(
                children: [
                  Text(performanceDetails.date),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0),
                  ),
                  Text(performanceDetails.duration),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Text(
                  '${performanceDetails.changes} ${performanceDetails.method}'),
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
                onPressed: () =>
                    bbApi.viewPerformance(performanceDetails.bellboardId),
                child: Text("View On Bellboard"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

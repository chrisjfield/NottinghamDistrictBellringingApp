import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../DistrictRingingApp.dart';
import '../../helpers/BellboardApi.dart';
import '../../models/PerformanceDetail.dart';
import '../../pageLayout/DetailPageScaffold.dart';

class PerformanceDetails extends StatelessWidget {
  final PerformanceDetail performanceDetails;

  PerformanceDetails({Key key, @required this.performanceDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BellboardApi bbApi = DistrictInheritedWidget.of(context).bbApi;

    final String performanceTitle =
        '${performanceDetails.changes} ${performanceDetails.method}';
    final String performanceRingers = performanceDetails.ringers
        .fold("", (prev, ringer) => prev + ringer + "\n")
        .trimRight();

    return DetailPageScaffold(
      titleText: "Performance Details",
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            _getPerformanceRow(
                performanceDetails.association, 18.0, FontWeight.bold, 20.0),
            _getPerformanceRow(
                performanceDetails.place, 16.0, FontWeight.w300, 20.0),
            _getPerformanceRow(performanceTitle, 15.0, FontWeight.normal, 5.0),
            _getTimings(),
            _getPerformanceRow(performanceRingers, 14.0, FontWeight.normal,
                10.0, TextAlign.start),
            _getPerformanceRow(
                performanceDetails.footnote, 14.0, FontWeight.normal, 10.0),
            _viewOnBellboard(bbApi),
          ],
        ),
      ),
    );
  }

  Widget _getPerformanceRow(
      String text, double textSize, FontWeight textWeight, double topPadding,
      [TextAlign textAlign = TextAlign.center]) {
    if (text == null || text.isEmpty == true) {
      return Container();
    }

    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              child: Text(
                text,
                maxLines: 20,
                textAlign: textAlign,
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: textWeight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getTimings() {
    final String performanceDate = DateFormat
        .yMMMMd("en_US")
        .format(DateTime.parse(performanceDetails.date));

    if (performanceDetails.duration != null &&
        performanceDetails.duration.isEmpty != true) {
      return _getTimingsRow(performanceDate);
    } else {
      return _getPerformanceRow(performanceDate, 15.0, FontWeight.normal, 10.0);
    }
  }

  Widget _getTimingsRow(String performanceDate) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, left: 50.0, right: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            performanceDate,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
          Text(
            performanceDetails.duration,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _viewOnBellboard(BellboardApi bbApi) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: RaisedButton(
        onPressed: () => bbApi.viewPerformance(performanceDetails.bellboardId),
        child: Text("View On Bellboard"),
      ),
    );
  }
}

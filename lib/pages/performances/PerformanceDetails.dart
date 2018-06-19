import 'package:flutter/material.dart';

import '../../DistrictRingingApp.dart';
import '../../api/BellboardApi.dart';
import '../../helpers/DateHelper.dart';
import '../../helpers/TextHelper.dart';
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
        padding: EdgeInsets.only(left: 40.0, top: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            TextHelper.textRowHeading(
                text: performanceDetails.association, topPadding: 20.0),
            TextHelper.textRowSubHeading(
                text: performanceDetails.place, topPadding: 20.0),
            TextHelper.textRowCenteredLarge(
                text: performanceTitle, topPadding: 5.0),
            _getTimings(),
            TextHelper.textRowLeft(text: performanceRingers, topPadding: 10.0),
            TextHelper.textRowCentered(
                text: performanceDetails.footnote, topPadding: 10.0),
            _viewOnBellboard(bbApi),
          ],
        ),
      ),
    );
  }

  Widget _getTimings() {
    final String performanceDate =
        DateHelper.fullDateFromDateString(performanceDetails.date);

    if (TextHelper.isNullOrEmpty(performanceDetails.duration)) {
      return TextHelper.textRowCenteredLarge(
          text: performanceDate, topPadding: 10.0);
    } else {
      return TextHelper.multipleTextRowCenteredLarge(
          textList: [performanceDate, performanceDetails.duration],
          topPadding: 10.0,
          leftPadding: 50.0,
          rightPadding: 70.0);
    }
  }

  Widget _viewOnBellboard(BellboardApi bbApi) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, right: 20.0),
      child: RaisedButton(
        onPressed: () => bbApi.viewPerformance(performanceDetails.bellboardId),
        child: Text("View On Bellboard"),
      ),
    );
  }
}

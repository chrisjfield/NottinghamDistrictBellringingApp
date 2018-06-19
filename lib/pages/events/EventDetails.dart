import 'package:flutter/material.dart';

import '../../helpers/ButtonHelper.dart';
import '../../helpers/DateHelper.dart';
import '../../helpers/TextHelper.dart';
import '../../models/EventDetail.dart';
import '../../pageLayout/DetailPageScaffold.dart';

class EventDetails extends StatelessWidget {
  final EventDetail eventDetails;

  EventDetails({Key key, @required this.eventDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailPageScaffold(
      titleText: "Event Details",
      child: _getEventDetails(context),
    );
  }

  List<Widget> _getButtons(BuildContext context, EventDetail eventDetails) {
    final List<Widget> buttons = [];

    if (eventDetails.postcode?.isNotEmpty ?? false) {
      buttons.add(
        ButtonHelper.createButton(
          context,
          'ROUTE',
          Icons.near_me,
          'https://www.google.com/maps/search/?api=1&query=${eventDetails.postcode}',
          true,
        ),
      );
    }

    if (eventDetails.doveId?.isNotEmpty ?? false) {
      buttons.add(
        ButtonHelper.createButton(
          context,
          'DOVE',
          Icons.notifications,
          'https://dove.cccbr.org.uk/detail.php?DoveID=${eventDetails.doveId}',
          true,
        ),
      );
    }

    return buttons;
  }

  Widget _getEventDetails(BuildContext context) {
    String location = eventDetails.location;
    String eventTime = DateHelper.dateFromDateTime(eventDetails.startTime);
    eventTime += ' ${DateHelper.timeFromDateTime(eventDetails.startTime)}';

    if (eventDetails.endTime != null) {
      final String eventEndTime =
          DateHelper.timeFromDateTime(eventDetails.endTime);
      eventTime += '-$eventEndTime';
    }

    if (!TextHelper.isNullOrEmpty(eventDetails.dedication)) {
      location += ', ${eventDetails.dedication}';
    }

    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 15.0),
            child: Image.asset(
              'images/core/bellringing_logo.png',
              height: 100.0,
            ),
          ),
          TextHelper.textRowHeading(text: eventDetails.title, topPadding: 10.0),
          TextHelper.textRowSubHeading(text: '$location', topPadding: 10.0),
          TextHelper.textRowSubHeading(text: '$eventTime', topPadding: 10.0),
          Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _getButtons(context, eventDetails),
            ),
          ),
          TextHelper.textRowCentered(
              text: eventDetails.description, topPadding: 10.0),
        ],
      ),
    );
  }
}

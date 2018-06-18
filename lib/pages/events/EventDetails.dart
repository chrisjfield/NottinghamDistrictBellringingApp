import 'package:flutter/material.dart';

import '../../models/EventDetail.dart';
import '../../pageLayout/DetailPageScaffold.dart';
import '../../helpers/TextHelper.dart';
import '../../helpers/DateHelper.dart';
import '../../helpers/UrlHelper.dart';

class EventDetails extends StatelessWidget {
  final EventDetail eventDetails;

  EventDetails({Key key, @required this.eventDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return DetailPageScaffold(
      titleText: "Event Details",
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Image.asset(
              'images/core/bellringing_logo.png',
              height: 100.0,
            ),
            TextHelper.textRowHeading(
                text: eventDetails.title, topPadding: 10.0),
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
      ),
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

  List<Widget> _getButtons(BuildContext context, EventDetail eventDetails) {
    final List<Widget> buttons = List<Widget>();

    if (eventDetails.postcode?.isNotEmpty ?? false) {
      buttons.add(_createButton(
        context,
        'ROUTE',
        Icons.near_me,
        UrlHelper.parse(
            'https://www.google.com/maps/search/?api=1&query=${eventDetails.postcode}'),
      ));
    }

    if (eventDetails.doveId?.isNotEmpty ?? false) {
      buttons.add(_createButton(
        context,
        'DOVE',
        Icons.notifications,
        UrlHelper.parse(
            'https://dove.cccbr.org.uk/detail.php?DoveID=${eventDetails.doveId}'),
      ));
    }

    return buttons;
  }
}

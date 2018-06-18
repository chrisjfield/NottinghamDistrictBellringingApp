import 'package:flutter/material.dart';

import '../../models/EventDetail.dart';
import '../../pageLayout/DetailPageScaffold.dart';

class EventDetails extends StatelessWidget {
  final EventDetail eventDetails;

  EventDetails({Key key, @required this.eventDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailPageScaffold(
      titleText: "Event Details",
      child: Text(eventDetails.title),
    );
  }
}

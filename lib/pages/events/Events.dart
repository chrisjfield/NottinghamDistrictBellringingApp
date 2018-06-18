import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/EventDetail.dart';
import '../../pageLayout/PageScaffold.dart';
import '../../settings/EventList.dart';
import 'EventDetails.dart';

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      titleText: 'Events',
      child: _getEventList(),
    );
  }

  Widget _getEventList() {
    return ListView.builder(
      itemCount: EventList.eventList
          .where((event) => event.startTime.isAfter(DateTime.now()))
          .length,
      itemBuilder: (BuildContext context, int index) =>
          _getListItem(context, index),
    );
  }

  ListTile _getListItem(BuildContext context, int index) {
    final EventDetail event = EventList.eventList
        .where((event) => event.startTime.isAfter(DateTime.now()))
        .toList()[index];

    final String location = event.location;
    String eventTime = DateFormat.Hm().format(event.startTime);

    if (event.endTime != null) {
      final String eventEndTime = DateFormat.Hm().format(event.endTime);
      eventTime += '-$eventEndTime';
    }

    return ListTile(
      title: Text(event.title),
      subtitle: Text('$location, $eventTime'),
      leading: Text(
        DateFormat.MMMd("en_US").format(event.startTime),
        style: TextStyle(
          fontSize: 12.0,
        ),
      ),
      onTap: () => _navigateToDetailPage(context, event),
    );
  }

  void _navigateToDetailPage(BuildContext context, EventDetail event) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventDetails(eventDetails: event),
      ),
    );
  }
}

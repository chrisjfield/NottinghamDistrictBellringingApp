import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../helpers/DateHelper.dart';
import '../models/EventDetail.dart';
import '../pages/events/EventDetails.dart';
import '../pages/events/Events.dart';
import '../settings/EventList.dart';

class NotificationsAPI {
  final AndroidNotificationDetails _androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'Nottingham Bellringing',
    'Nottingham Bellringing',
    'Notifications about bellringing in nottingham district',
    importance: Importance.Max,
    priority: Priority.High,
  );
  final IOSNotificationDetails _iOSPlatformChannelSpecifics =
      IOSNotificationDetails();

  FlutterLocalNotificationsPlugin notifications;
  NotificationDetails _platformChannelSpecifics;

  bool _initialised = false;
  bool _notificationsSet = false;

  NotificationsAPI() {
    notifications = FlutterLocalNotificationsPlugin();
    _platformChannelSpecifics = NotificationDetails(
      _androidPlatformChannelSpecifics,
      _iOSPlatformChannelSpecifics,
    );
  }

  Future createNotifications() async {
    if (!_notificationsSet) {
      //cancel existing notifications
      await notifications.cancelAll();

      //find all events more than 1 day away and schedule notifications
      EventList.eventList
          .where((event) =>
              event.startTime.isAfter(DateTime.now().add(Duration(days: 1))))
          .forEach((event) => _setEventNotification(event));
    }
  }

  void initialise(BuildContext context) {
    if (!_initialised) {
      AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('ic_launcher');
      IOSInitializationSettings initializationSettingsIOS =
          IOSInitializationSettings();

      InitializationSettings initializationSettings = InitializationSettings(
          initializationSettingsAndroid, initializationSettingsIOS);

      notifications.initialize(initializationSettings,
          selectNotification: (payload) =>
              _onSelectNotification(context, payload));

      _initialised = true;
    }
  }

  Future _onSelectNotification(BuildContext context, String payload) async {
    final EventDetail _event = EventList.eventList
        .firstWhere((event) => event.eventID.toString() == payload);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Events(),
      ),
    );

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventDetails(eventDetails: _event),
      ),
    );
  }

  void _setEventNotification(EventDetail event) async {
    final String location = event.location;
    final String eventTime = DateHelper.timeFromDateTime(event.startTime);
    final DateTime _scheduledNotificationDateTime =
        event.startTime.subtract(Duration(days: 1));

    await notifications.schedule(
      event.eventID,
      event.title,
      '$location, $eventTime tomorrow',
      _scheduledNotificationDateTime,
      _platformChannelSpecifics,
      payload: event.eventID.toString(),
    );
  }
}

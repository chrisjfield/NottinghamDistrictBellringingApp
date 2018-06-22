import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../pages/events/Events.dart';
import '../pages/events/EventDetails.dart';
import '../settings/EventList.dart';
import '../models/EventDetail.dart';

class NotificationsAPI {
  FlutterLocalNotificationsPlugin notifications;
  bool _alreadyInitialised = false;
  bool _alreadyShown = false;
  final AndroidNotificationDetails _androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
          'Nottingham Bellringing',
          'Nottingham Bellringing',
          'Notifications about bellringing in nottingham district',
          importance: Importance.Max,
          priority: Priority.High);
  final IOSNotificationDetails _iOSPlatformChannelSpecifics =
      IOSNotificationDetails();
  NotificationDetails _platformChannelSpecifics;

  NotificationsAPI() {
    notifications = FlutterLocalNotificationsPlugin();
    _platformChannelSpecifics = NotificationDetails(
        _androidPlatformChannelSpecifics, _iOSPlatformChannelSpecifics);
  }

  void initialise(BuildContext context) {
    if (!_alreadyInitialised) {
      AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('ic_launcher');
      IOSInitializationSettings initializationSettingsIOS =
          IOSInitializationSettings();

      InitializationSettings initializationSettings = InitializationSettings(
          initializationSettingsAndroid, initializationSettingsIOS);

      notifications.initialize(initializationSettings,
          selectNotification: (payload) =>
              _onSelectNotification(context, payload));

      _alreadyInitialised = true;
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

  Future showNotification(EventDetail event) async {
    if (!_alreadyShown) {
      await notifications.show(event.eventID, event.title,
          event.startTime.toString(), _platformChannelSpecifics,
          payload: event.eventID.toString());

      _alreadyShown = true;
    }
  }
}

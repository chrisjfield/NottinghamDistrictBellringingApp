import 'package:flutter/material.dart';

import 'api/BellboardApi.dart';
import 'api/NotificationsApi.dart';
import 'pages/home/Home.dart';
import 'routes/Routes.dart';
import 'settings/AppSettings.dart';

class DistrictInheritedWidget extends InheritedWidget {
  final BellboardApi bbApi;
  final NotificationsAPI notificationsAPI;

  const DistrictInheritedWidget(
      {Key key, this.bbApi, this.notificationsAPI, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(DistrictInheritedWidget old) => true;

  static DistrictInheritedWidget of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(DistrictInheritedWidget);
}

class DistrictRingingApp extends StatefulWidget {
  @override
  DistrictRingingAppState createState() => DistrictRingingAppState();
}

class DistrictRingingAppState extends State<DistrictRingingApp> {
  final BellboardApi bbApi = BellboardApi();
  final NotificationsAPI notificationsAPI = NotificationsAPI();

  @override
  Widget build(BuildContext context) {
    return DistrictInheritedWidget(
      bbApi: bbApi,
      notificationsAPI: notificationsAPI,
      child: RingingApp(),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

class RingingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppSettings.appTitle,
      theme: AppSettings.themeData,
      home: Home(),
      routes: Routes.routes,
    );
  }
}

import 'package:flutter/material.dart';

import 'helpers/BellboardApi.dart';
import 'pages/home/Home.dart';
import 'routes/Routes.dart';
import 'settings/AppSettings.dart';

class DistrictInheritedWidget extends InheritedWidget {
  final BellboardApi bbApi;

  const DistrictInheritedWidget({Key key, this.bbApi, Widget child})
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

  @override
  Widget build(BuildContext context) {
    return DistrictInheritedWidget(
      bbApi: bbApi,
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

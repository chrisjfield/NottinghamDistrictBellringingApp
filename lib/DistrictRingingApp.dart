import 'package:flutter/material.dart';

import 'pages/home/Home.dart';
import 'routes/Routes.dart';
import 'settings/AppSettings.dart';

class DistrictRingingApp extends StatelessWidget {
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

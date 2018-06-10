import 'package:flutter/material.dart';

import 'routes/Routes.dart';
import 'pages/Home.dart';

class NottinghamDistrictApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nottingham District',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      routes: Routes.routes,
    );
  }
}

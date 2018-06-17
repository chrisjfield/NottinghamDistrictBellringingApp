import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'DistrictRingingApp.dart';

void main() {
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(DistrictRingingApp());
}

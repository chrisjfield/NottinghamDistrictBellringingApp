import 'package:flutter/material.dart';

import '../pages/events/Events.dart';
import '../pages/Performances.dart';
import '../pages/towers/Towers.dart';

class RoutesEnum {
  static const String home = "/";
  static const String towers = "Towers";
  static const String performances = "Performances";
  static const String events = "Events";
}

class Routes {
  static final routes = <String, WidgetBuilder>{
    RoutesEnum.towers: (BuildContext context) => Towers(),
    RoutesEnum.performances: (BuildContext context) => Performances(),
    RoutesEnum.events: (BuildContext context) => Events(),
  };
}

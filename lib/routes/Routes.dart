import 'package:flutter/material.dart';
import 'RoutesEnum.dart';
import '../pages/Events.dart';
import '../pages/Performances.dart';
import '../pages/Towers.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    RoutesEnum.towers: (BuildContext context) => Towers(),
    RoutesEnum.performances: (BuildContext context) => Performances(),
    RoutesEnum.events: (BuildContext context) => Events(),
  };
}

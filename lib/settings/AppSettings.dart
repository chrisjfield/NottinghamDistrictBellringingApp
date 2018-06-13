import 'package:flutter/material.dart';

class AppSettings {
  static const String appTitle = 'Nottingham District';
  static const String homeTitleLine1 = 'Nottingham District';
  static const String homeTitleLine2 = 'Bellringing';
  static const String homeDescription = '''
      Welcome to the app for bellringing in the Nottingham district of the Southwell & Nottingham Guild. 
      You will find information on towers, recent performaces and upcoming events.
      ''';
  static final ThemeData themeData = ThemeData(
    primarySwatch: Colors.blue,
    primaryColorDark: Colors.black,
    accentColor: Colors.purpleAccent,
  );
}

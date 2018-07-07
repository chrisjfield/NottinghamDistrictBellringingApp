import 'package:flutter/material.dart';

class AppSettings {
  static const String appTitle = 'Nottingham District';
  static const String homeTitle = 'Nottingham District Bellringing';
  static const String districtWebiste =
      'https://www.southwelldg.org.uk/pages/district_main.php?district=5';
  static const String districtFacebook =
      'https://www.facebook.com/groups/513974708681458/';
  static const String homeDescription =
      'Welcome to the Nottingham district ringing app!\n\n Look around or contact us using the links below.';

  static final ThemeData themeData = ThemeData(
    primaryColor: Colors.green[800],
    primaryColorDark: Color(0xFF1B5E20),
    accentColor: Color(0xFF9E9E9E),
    backgroundColor: Color(0xFFEFEBE9),
    primaryIconTheme: IconThemeData(
      color: Color(0xFFFFFFFF),
    ),
  );
}

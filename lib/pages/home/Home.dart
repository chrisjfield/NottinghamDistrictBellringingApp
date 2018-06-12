import 'package:flutter/material.dart';

import '../../settings/AppSettings.dart';
import '../../pageLayout/PageScaffold.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      titleText: 'Home',
      child: _getHome(context),
    );
  }

  Widget _getLogo() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Image(
        image: AssetImage('images/core/District_Logo.png'),
        height: 250.0,
      ),
    );
  }

  Widget _getTitleRow(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.display1,
        ),
      ],
    );
  }

  Widget _getDescription() {
    return Padding(
      padding: EdgeInsets.only(top: 30.0, left: 40.0, right: 20.0),
      child: Text(
        AppSettings.homeDescription,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget _getHome(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _getLogo(),
          _getTitleRow(context, AppSettings.homeTitleLine1),
          _getTitleRow(context, AppSettings.homeTitleLine2),
          _getDescription(),
        ],
      ),
    );
  }
}

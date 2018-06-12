import 'package:flutter/material.dart';

import '../../pageLayout/PageScaffold.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      titleText: 'Home',
      child: _getHome(context),
    );
  }

  Widget _getHome(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'hello world - Home!',
            style: Theme.of(context).textTheme.display1,
          ),
        ],
      ),
    );
  }
}

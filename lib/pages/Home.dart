import 'package:flutter/material.dart';
import '../pageLayout/PageScaffold.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget home = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'home',
            style: Theme.of(context).textTheme.display1,
          ),
        ],
      ),
    );

    return PageScaffold(
      titleText: 'home',
      child: home,
    );
  }
}

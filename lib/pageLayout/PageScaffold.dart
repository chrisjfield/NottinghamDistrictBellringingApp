import 'package:flutter/material.dart';

import './PageDrawer.dart';

class PageScaffold extends StatelessWidget {
  final String titleText;
  final Widget child;

  const PageScaffold({Key key, @required this.titleText, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: PageDrawer(),
      appBar: AppBar(
        title: Text(titleText),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: child,
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}

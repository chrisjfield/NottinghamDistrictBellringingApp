import 'package:flutter/material.dart';

import './PageDrawer.dart';

class PageScaffold extends StatelessWidget {
  final String titleText;
  final Widget child;

  const PageScaffold({this.titleText, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: PageDrawer(),
      appBar: AppBar(
        title: (titleText != null) ? Text(titleText) : null,
      ),
      body: child,
    );
  }
}

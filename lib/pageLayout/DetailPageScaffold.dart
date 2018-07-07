import 'package:flutter/material.dart';

class DetailPageScaffold extends StatelessWidget {
  final String titleText;
  final Widget child;

  const DetailPageScaffold({Key key, @required this.titleText, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: child,
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}

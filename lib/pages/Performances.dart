import 'package:flutter/material.dart';
import '../pageLayout/PageScaffold.dart';

class Performances extends StatelessWidget {
  final Widget performances = Center(
    child: Text('hello world - Performances'),
  );

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      titleText: 'Performances',
      child: performances,
    );
  }
}

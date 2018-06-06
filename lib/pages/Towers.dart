import 'package:flutter/material.dart';
import '../pageLayout/PageScaffold.dart';

class Towers extends StatelessWidget {
  final Widget towers = Center(child: Text('hello world'));

  @override
  Widget build(BuildContext context) {
    return PageScaffold(titleText: 'Towers', child: towers);
  }
}

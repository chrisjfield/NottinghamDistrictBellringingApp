import 'package:flutter/material.dart';

import '../../pageLayout/PageScaffold.dart';

class Events extends StatelessWidget {
  final Widget events = Center(
    child: Text('hello world - Events'),
  );

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      titleText: 'Events',
      child: events,
    );
  }
}

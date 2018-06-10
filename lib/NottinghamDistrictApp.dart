import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'routes/Routes.dart';
import 'pages/Home.dart';
import 'state/AppState.dart';
import 'state/Reducers.dart';

class NottinghamDistrictApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducers,
    initialState: AppState.empty,
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Nottingham District',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
        routes: Routes.routes,
      ),
    );
  }
}

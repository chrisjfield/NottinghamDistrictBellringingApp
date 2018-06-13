import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helpers/BellboardApi.dart';
import '../models/PerformanceDetail.dart';
import '../pageLayout/PageScaffold.dart';
import 'PerformanceDetails.dart';

class Performances extends StatefulWidget {
  @override
  PerformancesState createState() => PerformancesState();
}

class PerformancesState extends State<StatefulWidget> {
  final List<PerformanceDetail> _performances = List<PerformanceDetail>();
  int _pageNumber = 1;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    if (_pageNumber == 1) {
      fetchPerformances();
    }

    return PageScaffold(
      titleText: 'Performances',
      child: RefreshIndicator(
        child: _getPerformaceWidget(),
        onRefresh: _refresh,
      ),
    );
  }

  void fetchPerformances() async {
    final List<PerformanceDetail> pagePerformaces =
        await BellboardApi().fetchPerformancesPage(_pageNumber);

    setState(() {
      _pageNumber += 1;
      _loading = false;
      _performances.addAll(pagePerformaces);
    });
  }

  ListTile _getListTime(int index) {
    final Widget finalTile =
        _loading ? CircularProgressIndicator() : Text("View More");

    if (index < _performances.length) {
      return ListTile(
        title: Text(_performances[index].place),
        subtitle: Text(
            _performances[index].changes + " " + _performances[index].method),
        leading: Text(
          DateFormat
              .MMMd("en_US")
              .format(DateTime.parse(_performances[index].date)),
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PerformanceDetails(
                    key: Key("performance1"),
                    performanceDetails: _performances[index],
                  ),
            ),
          );
        },
      );
    } else {
      return ListTile(
          title: Center(
            child: finalTile,
          ),
          onTap: () => _getMorePerformances());
    }
  }

  _getMorePerformances() {
    setState(() {
      _loading = true;
    });
    fetchPerformances();
  }

  _getPerformaceWidget() {
    if (_pageNumber == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          )
        ],
      );
    } else if (_performances.length == 0) {
      return Text("No performaces to show");
    } else {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) => _getListTime(index),
        itemCount: _performances.length + 1,
      );
    }
  }

  Future<Null> _refresh() async {
    setState(() {
      _pageNumber = 1;
      _performances.clear();
    });

    return null;
  }
}

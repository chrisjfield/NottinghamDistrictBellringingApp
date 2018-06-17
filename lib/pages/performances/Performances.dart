import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../DistrictRingingApp.dart';
import '../../helpers/BellboardApi.dart';
import '../../models/PerformanceDetail.dart';
import '../../pageLayout/PageScaffold.dart';
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
    final bbApi = DistrictInheritedWidget.of(context).bbApi;

    // if there is no data and it is not being retrieved, try to get some
    if (_pageNumber == 1 && _loading == false) {
      fetchPerformances(bbApi: bbApi);
    }

    return PageScaffold(
      titleText: 'Performances',
      child: RefreshIndicator(
        child: _getPerformaceWidget(bbApi),
        onRefresh: () => _refresh(bbApi),
      ),
    );
  }

  void fetchPerformances({BellboardApi bbApi, bool clearCache = false}) async {
    final List<PerformanceDetail> pagePerformaces = await bbApi
        .fetchPerformancesPage(pageNumber: _pageNumber, clearCache: clearCache);

    setState(() {
      _pageNumber += 1;
      _loading = false;
      _performances.addAll(pagePerformaces);
    });
  }

  ListTile _getListTime(BellboardApi bbApi, int index) {
    final Widget finalTile =
        _loading ? CircularProgressIndicator() : Text("View More");

    if (index < _performances.length) {
      return _getPerformanceTile(index);
    } else {
      return ListTile(
          title: Center(
            child: finalTile,
          ),
          onTap: () => _getMorePerformances(bbApi));
    }
  }

  Widget _getLoadingPage() {
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
  }

  _getMorePerformances(BellboardApi bbApi) {
    setState(() {
      _loading = true;
    });
    fetchPerformances(bbApi: bbApi);
  }

  _getPerformaceWidget(BellboardApi bbApi) {
    if (_pageNumber == 1) {
      return _getLoadingPage();
    } else if (_performances.length == 0) {
      return Text("No performaces to show");
    } else {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            _getListTime(bbApi, index),
        itemCount: _performances.length + 1,
      );
    }
  }

  ListTile _getPerformanceTile(int index) {
    return ListTile(
      title: Text(_performances[index].place),
      subtitle: Text(
          '${_performances[index].changes} ${_performances[index].method}'),
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
                  performanceDetails: _performances[index],
                ),
          ),
        );
      },
    );
  }

  Future<Null> _refresh(BellboardApi bbApi) async {
    setState(() {
      _pageNumber = 1;
      _performances.clear();
      _loading = true;
    });

    fetchPerformances(bbApi: bbApi, clearCache: true);

    return null;
  }
}

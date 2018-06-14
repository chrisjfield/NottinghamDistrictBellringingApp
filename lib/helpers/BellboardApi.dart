import 'dart:async';

import 'package:http/http.dart';

import '../models/PerformanceDetail.dart';
import '../settings/TowerList.dart';
import 'UrlHelper.dart';
import 'XmlHelper.dart';

class BellboardApi {
  static const String _baseURL = 'https://bb.ringingworld.co.uk';

  final Map<int, List<PerformanceDetail>> performancesCache =
      Map<int, List<PerformanceDetail>>();

  BellboardApi() {
    // load the first page of data on start up for performance
    fetchPerformancesPage(pageNumber: 1, clearCache: true);
  }

  Future<List<PerformanceDetail>> fetchPerformancesPage(
      {int pageNumber, bool clearCache = false}) async {
    // clear cache if requested
    if (clearCache) {
      performancesCache.clear();
    }

    // if the request exists in cache return it without making a http request
    if (performancesCache[pageNumber] != null) {
      return performancesCache[pageNumber];
    }

    final String url = _getRequestUrl(pageNumber);
    final Map<String, String> headers = _getRequestHeaders();

    final Response response = await get(url, headers: headers);

    final List<PerformanceDetail> performances =
        XmlHelper.convertResponseToPerformanceList(response);

    // ad the response to the cache
    performancesCache[pageNumber] = performances;

    return performances;
  }

  Map<String, String> _getRequestHeaders() {
    final Map<String, String> headers = Map<String, String>();
    headers['Cache-Control'] = 'no-cache, must-revalidate, no-store';

    return headers;
  }

  String _getRequestUrl(int pageNumber) {
    final String searchString = TowerList.towerList.fold('', (prev, tower) {
      return prev.isEmpty ? 'place=${tower.place}' : '$prev|${tower.place}';
    });

    return UrlHelper.parse(
      '$_baseURL/export.php?fmt=xml&$searchString&pagesize=10&page=${pageNumber.toString()}',
    );
  }
}

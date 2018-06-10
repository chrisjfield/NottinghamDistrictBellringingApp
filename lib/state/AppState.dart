import '../models/PerformanceDetail.dart';

class AppState {
  final List<PerformanceDetail> performances;
  final int performancePageRequest;
  final bool loading;
  static AppState empty = AppState(
    performances: List(),
    performancePageRequest: 1,
    loading: false,
  );

  AppState({this.performances, this.performancePageRequest, this.loading});
}

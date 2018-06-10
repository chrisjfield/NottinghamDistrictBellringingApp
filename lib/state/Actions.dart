import '../models/PerformanceDetail.dart';

class AddPerformancesPageAction {
  final List<PerformanceDetail> performances;

  AddPerformancesPageAction(this.performances);
}

class RefreshPerformancesAction {}

class SetAsLoadingAction {}

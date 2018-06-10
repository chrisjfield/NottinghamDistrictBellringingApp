import 'AppState.dart';
import 'Actions.dart';

AppState appReducers(AppState state, dynamic action) {
  if (action is AddPerformancesPageAction) {
    return _addPerformancesPage(state, action);
  } else if (action is RefreshPerformancesAction) {
    return _refreshPerformances();
  } else if (action is SetAsLoadingAction) {
    return _setAsLoading(state);
  }

  return state;
}

AppState _addPerformancesPage(
    AppState state, AddPerformancesPageAction action) {
  return AppState(
    performances: List.from(state.performances)..addAll(action.performances),
    performancePageRequest: state.performancePageRequest + 1,
    loading: false,
  );
}

AppState _refreshPerformances() {
  return AppState.empty;
}

AppState _setAsLoading(AppState state) {
  return AppState(
    performances: state.performances,
    performancePageRequest: state.performancePageRequest,
    loading: true,
  );
}

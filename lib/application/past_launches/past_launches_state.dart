part of 'past_launches_cubit.dart';

class PastLaunchesState {
  List<Launch>? pastLaunches;
  List<Launch>? filteredPastLaunches;
  String? errorMessage;
  bool? loading;

  PastLaunchesState({
    this.pastLaunches,
    this.filteredPastLaunches,
    this.errorMessage,
    this.loading
  });

  PastLaunchesState copyWith({
    ValueGetter<List<Launch>>? pastLaunches,
    ValueGetter<List<Launch>?>? filteredPastLaunches,
    ValueGetter<String?>? errorMessage,
    bool? loading,
  }) {
    return PastLaunchesState(
      pastLaunches: pastLaunches != null ? pastLaunches() : this.pastLaunches,
      filteredPastLaunches: filteredPastLaunches != null ? filteredPastLaunches() : this.filteredPastLaunches,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      loading: loading ?? false
    );
  }
}

// class PastLaunchesInitial extends PastLaunchesState {
//   PastLaunchesInitial();
// }
//
// class PastLaunchesLoading extends PastLaunchesState {
//   PastLaunchesLoading();
// }
//
// class PastLaunchesLoadedSuccessfully extends PastLaunchesState {
//   List<Launch>? pastLaunches;
//
//   PastLaunchesLoadedSuccessfully({required this.pastLaunches});
// }
//
// class PastLaunchesLoadedFailure extends PastLaunchesState {
//   String errorMessage;
//   PastLaunchesLoadedFailure(this.errorMessage);
// }
//
// class PastLaunchesFilteredSuccessfully extends PastLaunchesState {
//   List<Launch> filteredPastLaunches;
//   PastLaunchesFilteredSuccessfully({required this.filteredPastLaunches});
// }


part of 'past_launches_bloc.dart';

abstract class PastLaunchesState {
  const PastLaunchesState();
}

class PastLaunchesInitial extends PastLaunchesState {
  const PastLaunchesInitial();
}

class PastLaunchesLoading extends PastLaunchesState {
  const PastLaunchesLoading();
}

class PastLaunchesLoadedSuccessfully extends PastLaunchesState {
  List<Launch> pastLaunches;
  PastLaunchesLoadedSuccessfully({required this.pastLaunches});
}

class PastLaunchesLoadedFailure extends PastLaunchesState {
  String errorMessage;
  PastLaunchesLoadedFailure(this.errorMessage);
}
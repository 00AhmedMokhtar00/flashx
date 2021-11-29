part of 'past_launches_bloc.dart';


abstract class PastLaunchesEvent {}

class PastLaunchesCalled extends PastLaunchesEvent{
  PastLaunchesCalled();
}

class PastLaunchesFilteredByTwoDates extends PastLaunchesEvent{
  final int fromDate, toDate;
  final List<Launch> pastLaunches;
  PastLaunchesFilteredByTwoDates(this.fromDate, this.toDate, this.pastLaunches);
}
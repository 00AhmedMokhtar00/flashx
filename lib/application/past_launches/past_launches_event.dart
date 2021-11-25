part of 'past_launches_bloc.dart';


abstract class PastLaunchesEvent {}

class PastLaunchesStartedEvent extends PastLaunchesEvent {
  PastLaunchesStartedEvent();
}

class PastLaunchesCalled extends PastLaunchesEvent{
  PastLaunchesCalled();
}
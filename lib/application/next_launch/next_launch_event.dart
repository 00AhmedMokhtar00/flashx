part of 'next_launch_bloc.dart';

abstract class NextLaunchEvent {}

class NextLaunchStartedEvent extends NextLaunchEvent {
  NextLaunchStartedEvent();
}

class NextLaunchCalled extends NextLaunchEvent{
  NextLaunchCalled();
}
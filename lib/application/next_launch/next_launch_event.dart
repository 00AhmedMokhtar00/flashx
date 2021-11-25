part of 'next_launch_bloc.dart';

abstract class NextLaunchEvent {}

class NextLaunchCalled extends NextLaunchEvent{
  NextLaunchCalled();
}
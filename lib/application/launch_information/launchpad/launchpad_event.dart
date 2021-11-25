part of 'launchpad_bloc.dart';

abstract class LaunchPadEvent {}

class LaunchPadCalled extends LaunchPadEvent{
  final String launchPadId;
  LaunchPadCalled(this.launchPadId);
}
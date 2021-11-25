part of 'launchpad_bloc.dart';

abstract class LaunchPadState {
  const LaunchPadState();
}

class LaunchPadInitial extends LaunchPadState {
  const LaunchPadInitial();
}

class LaunchPadLoading extends LaunchPadState {
  const LaunchPadLoading();
}

class LaunchPadLoadedSuccessfully extends LaunchPadState {
  Launchpad launchPad;
  LaunchPadLoadedSuccessfully({required this.launchPad});
}

class LaunchPadLoadedFailure extends LaunchPadState {
  String errorMessage;
  LaunchPadLoadedFailure(this.errorMessage);
}
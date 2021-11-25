part of 'next_launch_bloc.dart';

abstract class NextLaunchState {
  const NextLaunchState();
}

class NextLaunchInitial extends NextLaunchState {
  const NextLaunchInitial();
}

class NextLaunchLoading extends NextLaunchState {
  const NextLaunchLoading();
}

class NextLaunchLoadedSuccessfully extends NextLaunchState {
  Launch nextLaunch;
  NextLaunchLoadedSuccessfully({required this.nextLaunch});
}

class NextLaunchLoadedFailure extends NextLaunchState {
  String errorMessage;
  NextLaunchLoadedFailure(this.errorMessage);
}
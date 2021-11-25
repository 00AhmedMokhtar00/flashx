part of 'flashx_bloc.dart';


abstract class FlashXState {
  const FlashXState();
}

class FlashXInitial extends FlashXState {
  const FlashXInitial();
}

class FlashXLoading extends FlashXState {
  const FlashXLoading();
}

class PastLaunchesLoadedSuccessfully extends FlashXState {
  List<Launch> pastLaunches;
  PastLaunchesLoadedSuccessfully({required this.pastLaunches});
}

class PastLaunchesLoadedFailure extends FlashXState {
  String errorMessage;
  PastLaunchesLoadedFailure(this.errorMessage);
}

class PayloadsLoadedSuccessfully extends FlashXState {
  List<Payload> payloads;
  PayloadsLoadedSuccessfully({required this.payloads});
}

class PayloadsLoadedFailure extends FlashXState {
  String errorMessage;
  PayloadsLoadedFailure(this.errorMessage);
}

class NextLaunchLoadedSuccessfully extends FlashXState {
  Launch nextLaunch;
  NextLaunchLoadedSuccessfully({required this.nextLaunch});
}

class NextLaunchLoadedFailure extends FlashXState {
  String errorMessage;
  NextLaunchLoadedFailure(this.errorMessage);
}

class LaunchPadLoadedSuccessfully extends FlashXState {
  Launchpad launchpad;
  LaunchPadLoadedSuccessfully({required this.launchpad});
}

class LaunchPadLoadedFailure extends FlashXState {
  String errorMessage;
  LaunchPadLoadedFailure(this.errorMessage);
}

class LaunchLoadedSuccessfully extends FlashXState {
  Launch launch;
  LaunchLoadedSuccessfully({required this.launch});
}

class LaunchLoadedFailure extends FlashXState {
  String errorMessage;
  LaunchLoadedFailure(this.errorMessage);
}

class RocketLoadedSuccessfully extends FlashXState {
  Rocket rocket;
  RocketLoadedSuccessfully({required this.rocket});
}

class RocketLoadedFailure extends FlashXState {
  String errorMessage;
  RocketLoadedFailure(this.errorMessage);
}

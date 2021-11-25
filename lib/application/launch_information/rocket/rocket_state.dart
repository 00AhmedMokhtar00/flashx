part of 'rocket_bloc.dart';

abstract class RocketState {
  const RocketState();
}

class RocketInitial extends RocketState {
  const RocketInitial();
}

class RocketLoading extends RocketState {
  const RocketLoading();
}

class RocketLoadedSuccessfully extends RocketState {
  Rocket rocket;
  RocketLoadedSuccessfully({required this.rocket});
}

class RocketLoadedFailure extends RocketState {
  String errorMessage;
  RocketLoadedFailure(this.errorMessage);
}
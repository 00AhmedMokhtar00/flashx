part of 'payload_bloc.dart';

abstract class PayloadsState {
  const PayloadsState();
}

class PayloadsInitial extends PayloadsState {
  const PayloadsInitial();
}

class PayloadsLoading extends PayloadsState {
  const PayloadsLoading();
}

class PayloadsLoadedSuccessfully extends PayloadsState {
  List<Payload> payloads;
  PayloadsLoadedSuccessfully({required this.payloads});
}

class PayloadsLoadedFailure extends PayloadsState {
  String errorMessage;
  PayloadsLoadedFailure(this.errorMessage);
}

class LaunchPayloadsLoadedSuccessfully extends PayloadsState {
  List<Payload> payloads;
  LaunchPayloadsLoadedSuccessfully({required this.payloads});
}

class LaunchPayloadsLoadedFailure extends PayloadsState {
  String errorMessage;
  LaunchPayloadsLoadedFailure(this.errorMessage);
}
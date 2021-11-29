part  of'payload_bloc.dart';

abstract class PayloadsEvent {}

class PayloadsCalled extends PayloadsEvent{
  PayloadsCalled();
}

class LaunchPayloadsCalled extends PayloadsEvent{
  Launch launch;
  LaunchPayloadsCalled(this.launch);
}
part of 'rocket_bloc.dart';

abstract class RocketEvent {}

class RocketCalled extends RocketEvent{
  final String rocketId;
  RocketCalled(this.rocketId);
}
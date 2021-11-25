part of 'flashx_bloc.dart';

abstract class FlashXEvent {}

class FlashXStartedEvent extends FlashXEvent {
  FlashXStartedEvent();
}

class FlashXGraphStarted extends FlashXEvent{

  FlashXGraphStarted();
}

class OrdersStatisticsStarted extends FlashXEvent{

  OrdersStatisticsStarted();
}
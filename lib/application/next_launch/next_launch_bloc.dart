import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/remote/flashx_repository.dart';
import 'package:flashx/domain/models.dart';

part 'next_launch_state.dart';
part 'next_launch_event.dart';
class NextLaunchBloc extends Bloc<NextLaunchEvent, NextLaunchState> {
  final FlashXRepository flashXRepository = FlashXRepository();
  NextLaunchBloc() : super(const NextLaunchInitial());

  @override
  Stream<NextLaunchState> mapEventToState(
      NextLaunchEvent event,
      ) async* {
    yield const NextLaunchLoading();
    if(event is NextLaunchStartedEvent){
      yield await flashXRepository.getNextLaunch();
    }
  }
}
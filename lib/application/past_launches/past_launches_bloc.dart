import 'package:flashx/domain/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/remote/flashx_repository.dart';

part 'past_launches_event.dart';
part 'past_launches_state.dart';
class PastLaunchesBloc extends Bloc<PastLaunchesEvent, PastLaunchesState> {
  final FlashXRepository flashXRepository = FlashXRepository();
  PastLaunchesBloc() : super(const PastLaunchesInitial());

  @override
  Stream<PastLaunchesState> mapEventToState(
      PastLaunchesEvent event,
      ) async* {
    yield const PastLaunchesLoading();
    if(event is PastLaunchesStartedEvent){
      //yield const PastLaunchesLoading();
      yield await flashXRepository.getPastLaunches();
    }
  }
}
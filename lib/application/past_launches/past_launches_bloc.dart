import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flashx/domain/models.dart';
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
    if(event is PastLaunchesCalled){
      yield await flashXRepository.getPastLaunches;
    }else if(event is PastLaunchesFilteredByTwoDates){
      yield await flashXRepository.getPastLaunchesFilteredByTwoDates(event.fromDate, event.toDate, event.pastLaunches);
    }
  }
}
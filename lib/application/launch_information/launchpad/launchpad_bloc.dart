import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/remote/flashx_repository.dart';
import 'package:flashx/domain/models.dart';

part 'launchpad_state.dart';
part 'launchpad_event.dart';
class LaunchPadBloc extends Bloc<LaunchPadEvent, LaunchPadState> {
  final FlashXRepository flashXRepository = FlashXRepository();
  LaunchPadBloc() : super(const LaunchPadInitial());

  @override
  Stream<LaunchPadState> mapEventToState(
      LaunchPadEvent event,
      ) async* {
    yield const LaunchPadLoading();
    if(event is LaunchPadCalled){
      yield await flashXRepository.getLaunchPadInformation(event.launchPadId);
    }
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/remote/flashx_repository.dart';
import 'package:flashx/domain/models.dart';

part 'rocket_state.dart';
part 'rocket_event.dart';
class RocketBloc extends Bloc<RocketEvent, RocketState> {
  final FlashXRepository flashXRepository = FlashXRepository();
  RocketBloc() : super(const RocketInitial());

  @override
  Stream<RocketState> mapEventToState(
      RocketEvent event,
      ) async* {
    yield const RocketLoading();
    if(event is RocketCalled){
      yield await flashXRepository.getRocketInformation(event.rocketId);
    }
  }
}
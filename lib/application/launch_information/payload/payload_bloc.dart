import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/remote/flashx_repository.dart';
import 'package:flashx/domain/models.dart';

part 'payload_state.dart';
part 'payload_event.dart';
class PayloadsBloc extends Bloc<PayloadsEvent, PayloadsState> {
  final FlashXRepository flashXRepository = FlashXRepository();
  PayloadsBloc() : super(const PayloadsInitial());

  @override
  Stream<PayloadsState> mapEventToState(
      PayloadsEvent event,
      ) async* {
    yield const PayloadsLoading();
    if(event is PayloadsCalled){
      yield await flashXRepository.getPayloads;
    }else if(event is LaunchPayloadsCalled){
      yield await flashXRepository.getLaunchPayloads(event.launch);
    }
  }
}
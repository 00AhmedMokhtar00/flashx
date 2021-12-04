import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/remote/flashx_repository.dart';
import 'package:flashx/domain/models.dart';

part 'payload_state.dart';
part 'payload_event.dart';
class PayloadsBloc extends Bloc<PayloadsEvent, PayloadsState> {
  final FlashXRepository flashXRepository = FlashXRepository();
  PayloadsBloc() : super(const PayloadsInitial()){
    on<PayloadsCalled>((event, emit) async{
      emit(const PayloadsLoading());
      emit(await flashXRepository.getPayloads);
    });

    on<LaunchPayloadsCalled>((event, emit) async{
      emit(const PayloadsLoading());
      emit(await flashXRepository.getLaunchPayloads(event.launch));
    });
  }
}
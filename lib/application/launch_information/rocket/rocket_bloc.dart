import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/remote/flashx_repository.dart';
import 'package:flashx/domain/models.dart';

part 'rocket_state.dart';
part 'rocket_event.dart';
class RocketBloc extends Bloc<RocketEvent, RocketState> {
  final FlashXRepository flashXRepository = FlashXRepository();
  RocketBloc() : super(const RocketInitial()){
    on<RocketCalled>((event, emit)async{
      emit(const RocketLoading());
      emit(await flashXRepository.getRocketInformation(event.rocketId));
    });
  }
}
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/remote/flashx_repository.dart';
import '../../domain/launch/launch.dart';

part 'past_launches_state.dart';

class PastLaunchesCubit extends Cubit<PastLaunchesState>{
  final FlashXRepository flashXRepository = FlashXRepository();
  PastLaunchesCubit() : super(PastLaunchesState());

  void callPastLaunches() async{
    //emit(const PastLaunchesLoading());
    emit(state.copyWith(loading: true));
    dynamic pastLaunches = await flashXRepository.getPastLaunches;
    emit(state.copyWith(loading: false));
    if(pastLaunches is String){
      emit(state.copyWith(errorMessage: pastLaunches.toString));
    }else{
      emit(state.copyWith(pastLaunches: () => pastLaunches, errorMessage: () => null, filteredPastLaunches: () => null));
    }
    //emit(await flashXRepository.getPastLaunches);
  }

  void filterPastLaunchesByTwoDates(int fromDate, int toDate) async{
    //emit(const PastLaunchesLoading());
    emit(state.copyWith(loading: true, filteredPastLaunches: () => []));
    dynamic response = await flashXRepository.getPastLaunchesFilteredByTwoDates(fromDate, toDate, state.pastLaunches!);
    emit(state.copyWith(loading: false));
    if(response is String){
      emit(state.copyWith(errorMessage: () => response.toString(), filteredPastLaunches: () => null));
    }else{
      emit(state.copyWith(filteredPastLaunches: () => response));
    }
  }

  void closeFilter(){
    emit(state.copyWith(loading: true));
    emit(state.copyWith(filteredPastLaunches: () => null));
    emit(state.copyWith(loading: false));
  }
}
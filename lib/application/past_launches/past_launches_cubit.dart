import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/remote/flashx_repository.dart';
import '../../domain/launch/launch.dart';

part 'past_launches_state.dart';

class PastLaunchesCubit extends Cubit<PastLaunchesState>{
  final FlashXRepository flashXRepository = FlashXRepository();
  PastLaunchesCubit() : super(const PastLaunchesInitial());

  void callPastLaunches() async{
    emit(const PastLaunchesLoading());
    emit(await flashXRepository.getPastLaunches);
  }

  void filterPastLaunchesByTwoDates(int fromDate, int toDate, List<Launch> pastLaunches) async{
    emit(const PastLaunchesLoading());
    emit(await flashXRepository.getPastLaunchesFilteredByTwoDates(fromDate, toDate, pastLaunches));
  }

}
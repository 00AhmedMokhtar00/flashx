import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/remote/flashx_repository.dart';
import '../../domain/launch/launch.dart';

part 'next_launch_state.dart';
class NextLaunchCubit extends Cubit<NextLaunchState> {
  final FlashXRepository flashXRepository = FlashXRepository();
  NextLaunchCubit() : super(const NextLaunchInitial());

    void callNextLaunch() async {
      emit(const NextLaunchLoading());
      emit(await flashXRepository.getNextLaunch);
    }
}
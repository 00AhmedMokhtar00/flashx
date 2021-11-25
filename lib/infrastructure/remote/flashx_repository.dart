import 'package:flashx/application/next_launch/next_launch_bloc.dart';

import '../../application/past_launches/past_launches_bloc.dart';
import 'base_configurations/flashx_api.dart';
import 'package:flashx/domain/models.dart';

abstract class BaseFlashXRepository{
  Future<PastLaunchesState> getPastLaunches();
}

class FlashXRepository{

  Future<PastLaunchesState> get getPastLaunches async{
    PastLaunchesState pastLaunchesState;
    try{
      final pastLaunchesResponseBody = await FlashXAPI.getPastLaunches;

      List<Launch> pastLaunches =
      pastLaunchesResponseBody.map((e) => Launch.fromJson(e)).cast<Launch>().toList();

      pastLaunchesState = PastLaunchesLoadedSuccessfully(pastLaunches: pastLaunches);
    }catch(errorMessage){
      pastLaunchesState = PastLaunchesLoadedFailure(errorMessage.toString());
    }
    return pastLaunchesState;
  }

  Future<NextLaunchState> get getNextLaunch async{
    NextLaunchState nextLaunchState;
    try{
      final nextLaunchResponseBody = await FlashXAPI.getNextLaunch;

      Launch nextLaunch = Launch.fromJson(nextLaunchResponseBody);

      nextLaunchState = NextLaunchLoadedSuccessfully(nextLaunch: nextLaunch);
    }catch(errorMessage){
      nextLaunchState = NextLaunchLoadedFailure(errorMessage.toString());
    }
    return nextLaunchState;
  }



}
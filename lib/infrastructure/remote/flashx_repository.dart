import 'package:flashx/application/blocs.dart';
import 'package:flashx/application/launch_information/launchpad/launchpad_bloc.dart';
import 'base_configurations/flashx_api.dart';
import 'package:flashx/domain/models.dart';

abstract class BaseFlashXRepository{
  Future<PastLaunchesState> get getPastLaunches;
  Future<NextLaunchState> get getNextLaunch;
  Future<PayloadsState> get getPayloads;

  Future<LaunchPadState> getLaunchPadInformation(String launchPadId);
  Future<RocketState> getRocketInformation(String rocketId);
}

class FlashXRepository{

  Future<PastLaunchesState> get getPastLaunches async{
    PastLaunchesState pastLaunchesState;
    try{
      final pastLaunchesResponseBody = await FlashXAPI.getPastLaunches;

      List<Launch> pastLaunches =
      pastLaunchesResponseBody.map((e) => Launch.fromJson(e)).cast<Launch>().toList();

      pastLaunches = pastLaunches.reversed.toList();

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

  Future<PayloadsState> get getPayloads async{
    PayloadsState payloadsState;
    try{
      final payloadsResponseBody = await FlashXAPI.getPayloads;

      List<Payload> payloads =
      payloadsResponseBody.map((e) => Payload.fromJson(e)).cast<Payload>().toList();

      payloadsState = PayloadsLoadedSuccessfully(payloads: payloads);
    }catch(errorMessage){
      payloadsState = PayloadsLoadedFailure(errorMessage.toString());
    }
    return payloadsState;
  }

  Future<RocketState> getRocketInformation(String rocketId) async{
    RocketState rocketState;
    try{
      final rocketInformationResponseBody = await FlashXAPI.getRocketById(rocketId);

      Rocket rocketInformation = Rocket.fromJson(rocketInformationResponseBody);

      rocketState = RocketLoadedSuccessfully(rocket: rocketInformation);
    }catch(errorMessage){
      rocketState = RocketLoadedFailure(errorMessage.toString());
    }
    return rocketState;
  }

  Future<LaunchPadState> getLaunchPadInformation(String launchPadId) async{
    LaunchPadState launchPadState;
    try{
      final launchPadInformationResponseBody = await FlashXAPI.getLaunchpadById(launchPadId);

      Launchpad launchPadInformation = Launchpad.fromJson(launchPadInformationResponseBody);

      launchPadState = LaunchPadLoadedSuccessfully(launchPad: launchPadInformation);
    }catch(errorMessage){
      launchPadState = LaunchPadLoadedFailure(errorMessage.toString());
    }
    return launchPadState;
  }

}
import 'package:flashx/application/blocs.dart';
import 'base_configurations/flashx_api.dart';
import 'package:flashx/domain/models.dart';
import '../local/manager.dart';

abstract class BaseFlashXRepository{
  Future<PastLaunchesState> get getPastLaunches;
  Future<NextLaunchState> get getNextLaunch;
  Future<PayloadsState> get getPayloads;

  Future<LaunchPadState> getLaunchPadInformation(String launchPadId);
  Future<RocketState> getRocketInformation(String rocketId);
  Future<PastLaunchesState> getPastLaunchesFilteredByTwoDates(int fromDate, int toDate, List<Launch> pastLaunches);
  Future<PayloadsState> getLaunchPayloads(Launch launch);
}

class FlashXRepository{

  Future<dynamic> get getPastLaunches async{
    //PastLaunchesState pastLaunchesState;
    try{
      final pastLaunchesResponseBody = await FlashXAPI.getPastLaunches;

      List<Launch> pastLaunches =
      pastLaunchesResponseBody.map((e) => Launch.fromJson(e)).cast<Launch>().toList();

      pastLaunches = pastLaunches.reversed.toList();
      LocalDatabaseManager.pastLaunches = pastLaunches;
      //pastLaunchesState = PastLaunchesLoadedSuccessfully(pastLaunches: pastLaunches);
      return pastLaunches;
    }catch(errorMessage){
      //pastLaunchesState = PastLaunchesLoadedFailure(errorMessage.toString());
      return errorMessage.toString();
    }
    //return pastLaunchesState;
  }

  Future<NextLaunchState> get getNextLaunch async{
    NextLaunchState nextLaunchState;
    try{
      final nextLaunchResponseBody = await FlashXAPI.getNextLaunch;

      Launch nextLaunch = Launch.fromJson(nextLaunchResponseBody);
      LocalDatabaseManager.nextLaunch = nextLaunch;
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

      LocalDatabaseManager.payloads = payloads;

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

  Future<dynamic> getPastLaunchesFilteredByTwoDates(int fromDate, int toDate, List<Launch> pastLaunches) async{
    //PastLaunchesState pastLaunchesState;
    try{
      await Future.delayed(const Duration(seconds: 1));
      List<Launch> filteredPastLaunches = pastLaunches.where((launch) => launch.date >= fromDate && launch.date <= toDate).toList();
      return filteredPastLaunches;
      //pastLaunchesState = PastLaunchesFilteredSuccessfully(filteredPastLaunches: filteredPastLaunches);
    }catch(errorMessage){
      return errorMessage.toString();
      //pastLaunchesState = PastLaunchesLoadedSuccessfully(pastLaunches: pastLaunches);
    }
    //return pastLaunchesState;
  }

  Future<PayloadsState> getLaunchPayloads(Launch launch) async{
    PayloadsState payloadsState;
    try{
      await Future.delayed(const Duration(seconds: 1));
      List<Payload> launchPayloads = LocalDatabaseManager.payloads.where((payload) => launch.payloadsId.contains(payload.id)).toList();

      payloadsState = LaunchPayloadsLoadedSuccessfully(payloads: launchPayloads);
    }catch(errorMessage){
      payloadsState = LaunchPayloadsLoadedFailure(errorMessage.toString());
    }
    return payloadsState;
  }



}
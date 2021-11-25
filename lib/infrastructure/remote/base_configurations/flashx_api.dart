import 'dart:convert';

import 'package:http/http.dart';

part 'server_addresses.dart';
part 'server_requester.dart';
part 'exception_mapper.dart';
class FlashXAPI{

  static Future<dynamic> get getPastLaunches async =>
      _responseHandler(await ServerRequester.getData(url: ServerAddresses.pastLaunches));

  static Future<dynamic> get getPayloads async =>
      _responseHandler(await ServerRequester.getData(url: ServerAddresses.payloads));

  static Future<dynamic> get getNextLaunch async =>
      _responseHandler(await ServerRequester.getData(url: ServerAddresses.nextLaunch));

  static Future<dynamic> getLaunchpadById(String launchpadId) async =>
      _responseHandler(await ServerRequester.getData(url: ServerAddresses.launchpadById, id: launchpadId));

  static Future<dynamic> getLaunchById(String launchId) async =>
      _responseHandler(await ServerRequester.getData(url: ServerAddresses.launchById, id: launchId));

  static Future<dynamic> getRocketById(String rocketId) async =>
      _responseHandler(await ServerRequester.getData(url: ServerAddresses.rocketById, id: rocketId));

  static dynamic _responseHandler(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occurred while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}
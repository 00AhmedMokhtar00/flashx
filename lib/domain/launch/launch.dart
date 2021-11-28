/*
{
        "fairings": {
            "reused": false,
            "recovery_attempt": false,
            "recovered": false,
            "ships": []
        },
        "links": {
            "patch": {
                "small": "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png",
                "large": "https://images2.imgbox.com/40/e3/GypSkayF_o.png"
            },
            "reddit": {
                "campaign": null,
                "launch": null,
                "media": null,
                "recovery": null
            },
            "flickr": {
                "small": [],
                "original": []
            },
            "presskit": null,
            "webcast": "https://www.youtube.com/watch?v=0a_00nJ_Y88",
            "youtube_id": "0a_00nJ_Y88",
            "article": "https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html",
            "wikipedia": "https://en.wikipedia.org/wiki/DemoSat"
        },
        "static_fire_date_utc": "2006-03-17T00:00:00.000Z",
        "static_fire_date_unix": 1142553600,
        "net": false,
        "window": 0,
        "rocket": "5e9d0d95eda69955f709d1eb",
        "success": false,
        "failures": [
            {
                "time": 33,
                "altitude": null,
                "reason": "merlin engine failure"
            }
        ],
        "details": "Engine failure at 33 seconds and loss of vehicle",
        "crew": [],
        "ships": [],
        "capsules": [],
        "payloads": [
            "5eb0e4b5b6c3bb0006eeb1e1"
        ],
        "launchpad": "5e9e4502f5090995de566f86",
        "flight_number": 1,
        "name": "FalconSat",
        "date_utc": "2006-03-24T22:30:00.000Z",
        "date_unix": 1143239400,
        "date_local": "2006-03-25T10:30:00+12:00",
        "date_precision": "hour",
        "upcoming": false,
        "cores": [
            {
                "core": "5e9e289df35918033d3b2623",
                "flight": 1,
                "gridfins": false,
                "legs": false,
                "reused": false,
                "landing_attempt": false,
                "landing_success": null,
                "landing_type": null,
                "landpad": null
            }
        ],
        "auto_update": true,
        "tbd": false,
        "launch_library_id": null,
        "id": "5eb87cd9ffd86e000604b32a"
    },
 */
import 'fairings.dart';
class Launch{
  late final Fairings fairings;
  late final String smallImage, largeImage;
  late final String webCast;
  late final int date;
  late final int datePrecision;
  late final String rocketId;
  late final bool success;
  late final String details;
  late final List<String> payloadsId;
  late final String launchpadId;
  late final int flightNumber;
  late final String name;
  late final String id;

  Launch({
    required this.fairings,
    required this.smallImage,
    required this.largeImage,
    required this.webCast,
    required this.date,
    required this.datePrecision,
    required this.rocketId,
    required this.success,
    required this.details,
    required this.payloadsId,
    required this.launchpadId,
    required this.flightNumber,
    required this.name,
    required this.id
});

  Launch.fromJson(Map<String, dynamic> json) {
    fairings = Fairings.fromJson(json['fairings']??{});
    smallImage = json['links']["patch"]["small"]??"";
    largeImage = json['links']["patch"]["large"]??"";
    webCast = json["webcast"]??"";
    date = json["date_unix"] == null? -1 : (json["date_unix"] + _calculateDatePrecision(json["date_precision"]??"")) * 1000; // as milliseconds
    datePrecision = _calculateDatePrecision(json["date_precision"]??"");
    rocketId = json["rocket"]??"";
    success = json["success"]??false;
    details = json["details"]??"";
    payloadsId = json["payloads"]?.cast<String>();
    launchpadId = json["launchpad"]??"";
    flightNumber = json["flight_number"]??-1;
    name = json["name"]??"";
    id = json["id"]??"";

  }

  int _calculateDatePrecision(String precision){
    // quarter: 7776000, half: 15552000, year: 31104000, month: 2592000, day: 86400, hour: 3600
    switch(precision){
      case 'year'    : return 31104000;
      case 'half'    : return 15552000;
      case 'quarter' : return 7776000;
      case 'month'   : return 2592000;
      case 'day'     : return 86400;
      case 'hour'    : return 3600;
      default: return 0;
    }
  }
}
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
  late final String wiki;
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
    required this.wiki,
    required this.name,
    required this.id
});

  Launch.fromJson(Map<String, dynamic> json) {
    fairings = Fairings.fromJson(json['fairings']??{});
    smallImage = json['links']["patch"]["small"]??"";
    largeImage = json['links']["patch"]["large"]??"";
    webCast = json["links"]["youtube_id"]??"";
    date = json["date_unix"] == null? -1 : (json["date_unix"] + _calculateDatePrecision(json["date_precision"]??"")) * 1000; // as milliseconds
    datePrecision = _calculateDatePrecision(json["date_precision"]??"");
    rocketId = json["rocket"]??"";
    success = json["success"]??false;
    details = json["details"]??"";
    payloadsId = json["payloads"]?.cast<String>();
    launchpadId = json["launchpad"]??"";
    flightNumber = json["flight_number"]??-1;
    wiki = json["links"]["wikipedia"]??"";
    name = json["name"]??"";
    id = json["id"]??"";

  }

  int _calculateDatePrecision(String precision){
    /// quarter: 7776000, half: 15552000, year: 31104000, month: 2592000, day: 86400, hour: 3600
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
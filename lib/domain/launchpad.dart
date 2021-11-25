/*
{
        "images": {
            "large": [
                "https://i.imgur.com/KHBk6jO.png"
            ]
        },
        "id": "5e9e3032383ecb267a34e7c7"
    },
 */


class Launchpad {
  late final String largeImage;
  late final String smallImage;
  late final String name;
  late final String fullName;
  late final String status;
  late final String type;
  late final String locality;
  late final String region;
  late final num launchAttempts;
  late final num launchSuccesses;
  late final String wikipedia;
  late final String details;
  late final List<String> launches;
  late final String id;

  Launchpad({
    required this.largeImage,
    required this.smallImage,
    required this.name,
    required this.fullName,
    required this.status,
    required this.type,
    required this.locality,
    required this.region,
    required this.launchAttempts,
    required this.launchSuccesses,
    required this.wikipedia,
    required this.details,
    required this.launches,
    required this.id,
  });


  Launchpad.fromJson(Map<String, dynamic> json) {
    largeImage = json['images']['large']?.first.toString()??"";
    smallImage = json['images']['small']?.first.toString()??"";
    name = json['name']??"";
    fullName = json['full_name']??"";
    locality = json['locality']??"";
    region = json['region']??"";
    launchAttempts = json['launch_attempts']??-1;
    launchSuccesses = json['launch_successes']??-1;
    launches = json['launches']?.cast<String>();
    details = json['details']??"";
    status = json['status']??"";
    id = json['id']??"";
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['name'] = name;
  //   data['full_name'] = fullName;
  //   data['locality'] = locality;
  //   data['region'] = region;
  //   data['launch_attempts'] = launchAttempts;
  //   data['launch_successes'] = launchSuccesses;
  //   data['launches'] = launches;
  //   data['details'] = details;
  //   data['status'] = status;
  //   data['id'] = id;
  //   return data;
  // }


}

/*
{



        "flickr_images": [
            "https://imgur.com/DaCfMsj.jpg",
            "https://imgur.com/azYafd8.jpg"
        ],
        "name": "Falcon 1",
        "active": false,
        "cost_per_launch": 6700000,
        "success_rate_pct": 40,
        "wikipedia": "https://en.wikipedia.org/wiki/Falcon_1",
        "description": "The Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth.",
        "id": "5e9d0d95eda69955f709d1eb"
    },
 */
class Rocket{
  late final List<String> images;
  late final String name;
  late final bool active;
  late final num costPerLaunch;
  late final num successRatePercentage;
  late final String wikipedia;
  late final String description;
  late final String id;

  Rocket({
    required this.images,
    required this.name,
    required this.active,
    required this.costPerLaunch,
    required this.successRatePercentage,
    required this.wikipedia,
    required this.description,
    required this.id,
  });

  Rocket.fromJson(Map<String, dynamic> json) {
    images = json['flickr_images']?.cast<String>();
    name = json['name']??"";
    active = json['active']??false;
    costPerLaunch = json['cost_per_launch']??-1;
    successRatePercentage = json['success_rate_pct']??-1;
    wikipedia = json['wikipedia']??"";
    description = json['description']??"";
    id = json['id']??"";
  }

}
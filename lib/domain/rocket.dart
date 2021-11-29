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
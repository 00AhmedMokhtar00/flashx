/*
{
        "name": "FalconSAT-2",
        "type": "Satellite",
        "reused": false,
        "launch": "5eb87cd9ffd86e000604b32a",
        "customers": [
            "DARPA"
        ],
        "nationalities": [
            "United States"
        ],
        "manufacturers": [
            "SSTL"
        ],
        "mass_kg": 20,
        "mass_lbs": 43,
        "orbit": "LEO",
        "id": "5eb0e4b5b6c3bb0006eeb1e1"
    },
 */

class Payload{
  late final String name;
  late final String type;
  late final bool reused;
  late final String launch;
  late final List<String> customers;
  late final List<String> nationalities;
  late final List<String> manufacturers;
  late final num massKg;
  late final num massLbs;
  late final String orbit;
  late final String id;

  Payload({
    required this.name,
    required this.type,
    required this.reused,
    required this.launch,
    required this.customers,
    required this.nationalities,
    required this.manufacturers,
    required this.massKg,
    required this.massLbs,
    required this.orbit,
    required this.id,
  });

  Payload.fromJson(Map<String, dynamic> json) {
    name = json['name']??"";
    type = json['type']??"";
    reused = json['reused']??"";
    launch = json['launch']??"";
    customers = json['customers']?.cast<String>();
    nationalities = json['nationalities']?.cast<String>();
    manufacturers = json['manufacturers']?.cast<String>();
    massKg = json['mass_kg']??-1;
    massLbs = json['mass_lbs']??-1;
    orbit = json['orbit']??"";
    id = json['id']??"";
  }


}
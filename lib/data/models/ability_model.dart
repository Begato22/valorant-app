// ignore_for_file: constant_identifier_names

import 'package:valorant_app/data/models/agent_model.dart';

class AbilityModel {
  Slot slot;
  String displayName;
  String description;
  String? displayIcon;

  AbilityModel({
    required this.slot,
    required this.displayName,
    required this.description,
    this.displayIcon,
  });

  factory AbilityModel.fromJson(Map<String, dynamic> json) => AbilityModel(
        slot: slotValues.map[json["slot"]]!,
        displayName: json["displayName"],
        description: json["description"],
        displayIcon: json["displayIcon"],
      );

  Map<String, dynamic> toJson() => {
        "slot": slotValues.reverse[slot],
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon,
      };
}

enum Slot { ABILITY1, ABILITY2, GRENADE, ULTIMATE, PASSIVE }

final slotValues = EnumValues(
    {"Ability1": Slot.ABILITY1, "Ability2": Slot.ABILITY2, "Grenade": Slot.GRENADE, "Passive": Slot.PASSIVE, "Ultimate": Slot.ULTIMATE});

// ignore_for_file: constant_identifier_names

import 'agent_model.dart';

class RoleModel {
  String uuid;
  DisplayName displayName;
  String description;
  String displayIcon;
  String assetPath;

  RoleModel({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.assetPath,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        uuid: json["uuid"],
        displayName: displayNameValues.map[json["displayName"]]!,
        description: json["description"],
        displayIcon: json["displayIcon"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayNameValues.reverse[displayName],
        "description": description,
        "displayIcon": displayIcon,
        "assetPath": assetPath,
      };
}

final displayNameValues = EnumValues({
  "Controller": DisplayName.CONTROLLER,
  "Duelist": DisplayName.DUELIST,
  "Initiator": DisplayName.INITIATOR,
  "Sentinel": DisplayName.SENTINEL
});

enum DisplayName { INITIATOR, DUELIST, SENTINEL, CONTROLLER }

import 'package:valorant_app/data/models/ability_model.dart';
import 'package:valorant_app/data/models/role_model.dart';
import 'package:valorant_app/data/models/voice_line_model.dart';

class CharacterModel {
  String uuid;
  String displayName;
  String description;
  // List<String>? characterTags;
  String displayIcon;
  // String displayIconSmall;
  // String? bustPortrait;
  String? fullPortrait;
  // String? fullPortraitV2;
  // String killFeedPortrait;
  String? background;
  // List<String> backgroundGradientColors;
  // String assetPath;
  // bool isFullPortraitRightFacing;
  // bool isPlayableCharacter;
  // bool isAvailableForTest;
  // bool isBaseContent;
  RoleModel? role;
  List<AbilityModel> abilities;
  VoiceLineModel voiceLine;

  CharacterModel({
    required this.uuid,
    required this.displayName,
    required this.description,
    // required this.developerName,
    // this.characterTags,
    required this.displayIcon,
    // required this.displayIconSmall,
    // this.bustPortrait,
    this.fullPortrait,
    // this.fullPortraitV2,
    // required this.killFeedPortrait,
    this.background,
    // required this.backgroundGradientColors,
    // required this.assetPath,
    // required this.isFullPortraitRightFacing,
    // required this.isPlayableCharacter,
    // required this.isAvailableForTest,
    // required this.isBaseContent,
    this.role,
    required this.abilities,
    required this.voiceLine,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        uuid: json["uuid"],
        displayName: json["displayName"],
        description: json["description"],
        // developerName: json["developerName"],
        // characterTags: json["characterTags"] == null ? [] : List<String>.from(json["characterTags"]!.map((x) => x)),
        displayIcon: json["displayIcon"],
        // displayIconSmall: json["displayIconSmall"],
        // bustPortrait: json["bustPortrait"],
        fullPortrait: json["fullPortrait"],
        // fullPortraitV2: json["fullPortraitV2"],
        // killFeedPortrait: json["killfeedPortrait"],
        background: json["background"],
        // backgroundGradientColors: List<String>.from(json["backgroundGradientColors"].map((x) => x)),
        // assetPath: json["assetPath"],
        // isFullPortraitRightFacing: json["isFullPortraitRightFacing"],
        // isPlayableCharacter: json["isPlayableCharacter"],
        // isAvailableForTest: json["isAvailableForTest"],
        // isBaseContent: json["isBaseContent"],
        role: json["role"] == null ? null : RoleModel.fromJson(json["role"]),
        abilities: List<AbilityModel>.from(json["abilities"].map((x) => AbilityModel.fromJson(x))),
        voiceLine: VoiceLineModel.fromJson(json["voiceLine"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "description": description,
        // "developerName": developerName,
        // "characterTags": characterTags == null ? [] : List<dynamic>.from(characterTags!.map((x) => x)),
        "displayIcon": displayIcon,
        // "displayIconSmall": displayIconSmall,
        // "bustPortrait": bustPortrait,
        "fullPortrait": fullPortrait,
        // "fullPortraitV2": fullPortraitV2,
        // "killfeedPortrait": killFeedPortrait,
        "background": background,
        // "backgroundGradientColors": List<dynamic>.from(backgroundGradientColors.map((x) => x)),
        // "assetPath": assetPath,
        // "isFullPortraitRightFacing": isFullPortraitRightFacing,
        // "isPlayableCharacter": isPlayableCharacter,
        // "isAvailableForTest": isAvailableForTest,
        // "isBaseContent": isBaseContent,
        "role": role?.toJson(),
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "voiceLine": voiceLine.toJson(),
      };
}

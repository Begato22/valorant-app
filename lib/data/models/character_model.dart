import 'package:valorant_app/data/models/ability_model.dart';
import 'package:valorant_app/data/models/role_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/character_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CharacterModel {
  final String uuid;
  final String displayName;
  final String description;
  final String developerName;
  final List<String>? characterTags;
  final String displayIcon;
  final String displayIconSmall;
  final String? bustPortrait;
  final String? fullPortrait;
  final String? fullPortraitV2;
  // final String killfeedPortrait;
  final String? background;
  final List<String> backgroundGradientColors;
  final String assetPath;
  final bool isFullPortraitRightFacing;
  final bool isPlayableCharacter;
  final bool isAvailableForTest;
  final bool isBaseContent;
  final RoleModel? role;
  List<AbilityModel> abilities;
  // List<VoiceLineModel> voiceLine;

  CharacterModel({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.developerName,
    this.characterTags,
    required this.displayIcon,
    required this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    // required this.killFeedPortrait,
    this.background,
    required this.backgroundGradientColors,
    required this.assetPath,
    required this.isFullPortraitRightFacing,
    required this.isPlayableCharacter,
    required this.isAvailableForTest,
    required this.isBaseContent,
    this.role,
    required this.abilities,

    // required this.voiceLine,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}

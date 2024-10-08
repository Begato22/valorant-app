import 'package:flutter/material.dart';
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
  final String killfeedPortrait;
  final String? background;
  @ColorListConverter()
  final List<Color> backgroundGradientColors;
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
    this.background,
    required this.killfeedPortrait,
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

class ColorListConverter implements JsonConverter<List<Color>, List<dynamic>> {
  const ColorListConverter();

  @override
  List<Color> fromJson(List<dynamic> json) {
    // Ensure that each item in the list is a string
    return json.map((colorString) => _colorFromHex(colorString as String)).toList();
  }

  @override
  List<dynamic> toJson(List<Color> colors) {
    return colors.map((color) => _colorToHex(color)).toList();
  }

  // Helper method to convert hex string to Color
  Color _colorFromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  // Helper method to convert Color to hex string
  String _colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }
}

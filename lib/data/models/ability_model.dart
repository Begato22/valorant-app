import 'package:json_annotation/json_annotation.dart';

part 'generated/ability_model.g.dart';

@JsonSerializable()
class AbilityModel {
  final Slot slot;
  final String displayName;
  final String description;
  final String? displayIcon;

  AbilityModel({
    required this.slot,
    required this.displayName,
    required this.description,
    this.displayIcon,
  });

  // JSON serialization methods
  factory AbilityModel.fromJson(Map<String, dynamic> json) => _$AbilityModelFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityModelToJson(this);
}

// Enum with JSON support
enum Slot { Ability1, Ability2, Grenade, Passive, Ultimate }

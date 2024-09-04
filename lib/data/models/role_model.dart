// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'generated/role_model.g.dart';

@JsonSerializable()
class RoleModel {
  final String uuid;
  final DisplayName displayName;
  final String description;
  final String displayIcon;
  final String assetPath;

  RoleModel({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.assetPath,
  });

  // JSON serialization methods
  factory RoleModel.fromJson(Map<String, dynamic> json) => _$RoleModelFromJson(json);
  Map<String, dynamic> toJson() => _$RoleModelToJson(this);
}

// Enum with JSON support
enum DisplayName { Initiator, Duelist, Sentinel, Controller }

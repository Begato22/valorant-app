import 'package:json_annotation/json_annotation.dart';
import 'package:valorant_app/data/models/character_model.dart';

part 'generated/agent_model.g.dart'; // Add this line to specify the location of the generated file

@JsonSerializable(explicitToJson: true)
class AgentModel {
  final int status;
  final List<CharacterModel> data;

  AgentModel({
    required this.status,
    required this.data,
  });

  // JSON serialization methods
  factory AgentModel.fromJson(Map<String, dynamic> json) => _$AgentModelFromJson(json);
  Map<String, dynamic> toJson() => _$AgentModelToJson(this);
}

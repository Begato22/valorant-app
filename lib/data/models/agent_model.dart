// To parse this JSON data, do
//
//     final agentModel = agentModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:valorant_app/data/models/character_model.dart';

AgentModel agentModelFromJson(String str) => AgentModel.fromJson(json.decode(str));

String agentModelToJson(AgentModel data) => json.encode(data.toJson());

class AgentModel {
  int status;
  List<CharacterModel> characters;

  AgentModel({
    required this.status,
    required this.characters,
  });

  factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
        status: json["status"],
        characters: List<CharacterModel>.from(json["data"].map((x) => CharacterModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(characters.map((x) => x.toJson())),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

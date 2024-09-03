// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../agent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentModel _$AgentModelFromJson(Map<String, dynamic> json) => AgentModel(
      status: (json['status'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AgentModelToJson(AgentModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

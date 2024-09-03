// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => RoleModel(
      uuid: json['uuid'] as String,
      displayName: $enumDecode(_$DisplayNameEnumMap, json['displayName']),
      description: json['description'] as String,
      displayIcon: json['displayIcon'] as String,
      assetPath: json['assetPath'] as String,
    );

Map<String, dynamic> _$RoleModelToJson(RoleModel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'displayName': _$DisplayNameEnumMap[instance.displayName]!,
      'description': instance.description,
      'displayIcon': instance.displayIcon,
      'assetPath': instance.assetPath,
    };

const _$DisplayNameEnumMap = {
  DisplayName.Initiator: 'Initiator',
  DisplayName.Duelist: 'Duelist',
  DisplayName.Sentinel: 'Sentinel',
  DisplayName.Controller: 'Controller',
};

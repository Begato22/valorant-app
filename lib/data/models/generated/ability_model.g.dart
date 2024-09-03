// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../ability_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbilityModel _$AbilityModelFromJson(Map<String, dynamic> json) => AbilityModel(
      slot: $enumDecode(_$SlotEnumMap, json['slot']),
      displayName: json['displayName'] as String,
      description: json['description'] as String,
      displayIcon: json['displayIcon'] as String?,
    );

Map<String, dynamic> _$AbilityModelToJson(AbilityModel instance) =>
    <String, dynamic>{
      'slot': _$SlotEnumMap[instance.slot]!,
      'displayName': instance.displayName,
      'description': instance.description,
      'displayIcon': instance.displayIcon,
    };

const _$SlotEnumMap = {
  Slot.Ability1: 'Ability1',
  Slot.Ability2: 'Ability2',
  Slot.Grenade: 'Grenade',
  Slot.Passive: 'Passive',
  Slot.Ultimate: 'Ultimate',
};

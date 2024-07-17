// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      idplanta: json['idplanta'] as int,
      descripcion: json['descripcion'] as String,
      empresa: json['empresa'] as String,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'idplanta': instance.idplanta,
      'descripcion': instance.descripcion,
      'empresa': instance.empresa,
    };

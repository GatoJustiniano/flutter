// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) => Usuario(
      nombre: json['nombre'] as String,
      carrera: json['carrera'] as String,
      experiencia: json['experiencia'] as int,
      institucion: json['institucion'] as String,
    );

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'nombre': instance.nombre,
      'carrera': instance.carrera,
      'experiencia': instance.experiencia,
      'institucion': instance.institucion,
    };

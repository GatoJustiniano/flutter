import 'package:json_annotation/json_annotation.dart';
part 'usuario.g.dart';

@JsonSerializable(explicitToJson: true)
class Usuario {
  String nombre;
  String carrera;
  int experiencia;
  String institucion;

  Usuario({required this.nombre, required this.carrera, required this.experiencia, required this.institucion});

  factory Usuario.fromJson(Map<String, dynamic> data) => _$UsuarioFromJson(data);

  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}

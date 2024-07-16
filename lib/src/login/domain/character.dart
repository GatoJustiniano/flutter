import 'package:json_annotation/json_annotation.dart';
part 'character.g.dart';

@JsonSerializable(explicitToJson: true)
class Character {
  int idplanta;
  String descripcion;
  String empresa;

  Character(
      {required this.idplanta,
      required this.descripcion,
      required this.empresa});

  factory Character.fromJson(Map<String, dynamic> data) =>
      _$CharacterFromJson(data);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

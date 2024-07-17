import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/character.dart';

class UsuarioResponse {
  Character parsedCharacter({required http.Response raw}) {
    if (raw.statusCode == 200) {
      Map<String, dynamic> body = json.decode(raw.body) as Map<String, dynamic>;

      Character data = Character.fromJson(body);
      // print(raw.statusCode);
      return data;
    } else {
      // print(raw.body);
      throw (raw.body);
    }
  }
}

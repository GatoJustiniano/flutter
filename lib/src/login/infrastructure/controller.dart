import '../domain/character.dart';
import './api.dart';
import '../application/response.dart';

class UsuarioController {
  UsuarioApi usuarioApi = UsuarioApi();
  UsuarioResponse usuarioResponse = UsuarioResponse();

  Future<Character> usuario(
      {required String user, required String pass}) async {
    final raw = await usuarioApi.getUsuarios(user: user, pass: pass);
    // print(raw.body);
    final character = usuarioResponse.parsedCharacter(raw: raw);
    // print(character.descripcion);
    return character;
  }
}

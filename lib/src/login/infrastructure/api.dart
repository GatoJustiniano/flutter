import 'package:http/http.dart' as http;
import 'dart:convert';

class UsuarioApi {
  Future<http.Response> getUsuarios(
      {required String pass, required String user}) async {
    Map data = {"usuario": user, "contrasena": pass};
    Uri url = Uri.parse('http://134.122.30.27:3111/api/v1/usuario/data');
    var body = json.encode(data);
    http.Response response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    return response;
  }
}

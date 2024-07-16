import './api.dart';
import '../application/response.dart';

import '../domain/usuario.dart';

class ClienteController {
  // UsuarioApi usuarioApi = UsuarioApi();
  ClienteResponse clienteResponse = ClienteResponse();
  ClienteResponse clienteData = ClienteResponse();

  Future<List<Usuario>> clienteDataControler() async {
    final raw = clienteResponse.dataCliente();
    // final data = clienteData.parsedCliente(raw);
    print(raw);
    return raw;
  }
}

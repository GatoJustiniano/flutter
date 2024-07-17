import '../application/response.dart';

import '../domain/usuario.dart';

class ClienteController {
  ClienteResponse clienteResponse = ClienteResponse();
  ClienteResponse clienteData = ClienteResponse();

  Future<List<Usuario>> clienteDataControler() async {
    final raw = clienteResponse.dataCliente();
    print(raw);
    return raw;
  }
}

import '../domain/usuario.dart';

class ClienteResponse {
  List<Usuario> dataCliente() {
    //transformar texto a JSON
    List<dynamic> body = [
      {
        "nombre": "Ana Palacios",
        "carrera": "Fisioterapia y rehabilitación",
        "experiencia": 6,
        "institucion": "Instituto superior Daniel Alcides Carrion"
      },
      {
        "nombre": "Bryan",
        "carrera": "Fisioterapia ",
        "experiencia": 6,
        "institucion": "Instituto superior Daniel Alcides Carrion"
      },
      {
        "nombre": "Ana Palacios",
        "carrera": "Rehabilitación",
        "experiencia": 6,
        "institucion": "Instituto superior Daniel Alcides Carrion"
      }
      
    ];
    List<Usuario> data = body.map((i) => Usuario.fromJson(i)).toList();
    print(data);
    return data;
  }
}

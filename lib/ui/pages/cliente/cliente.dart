// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sys4signal/src/cliente/domain/usuario.dart';
import 'package:sys4signal/src/cliente/infrastructure/controller.dart';

import '../../widget/mydrawer.dart';

class ClienteDash extends StatefulWidget {
  const ClienteDash({Key? key}) : super(key: key);

  @override
  State<ClienteDash> createState() => _ClienteDashState();
}

class _ClienteDashState extends State<ClienteDash> {
  List<Usuario> data = [];
  String nombre = "";
  bool close = true;
  bool check = true;
  ClienteController clienteController = ClienteController();
  @override
  void initState() {
    clienteController.clienteDataControler().then((value) async {
      print(value);
      setState(
        () {
          data = value;
        },
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FISIO-APP"),
      ),
      drawer: myDrawer(cntx: context),
      body: ListTileTheme(
        contentPadding: const EdgeInsets.all(15),
        iconColor: Colors.red,
        textColor: Colors.black54,
        tileColor: Colors.yellow[100],
        child: ListTile(
          dense: true,
          title: FutureBuilder(
            future: clienteController.clienteDataControler(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: Text("Cargando.."));
              }
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                        title: Text(
                            "${data[index].nombre}\n${data[index].carrera}"),
                        subtitle: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _buildPopupDialog(
                                context,
                              ),
                            );
                            setState(() {
                              nombre = data[index].nombre;
                            });
                          },
                          child: const Text("Perfil"),
                        ),
                        tileColor: Colors.white),
                  );
                },
              );
            },
          ),
        ),
      ),
      //
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      // title: const Text('Seleccione Rango de Fecha'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColor,
          ),
          child: SizedBox(
            height: 250,
            width: 250,
            child: Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(nombre,
                        style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic)),
                    Text(data[0].carrera,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontStyle: FontStyle.italic)),
                    Text(
                        '${data[0].experiencia} años de Experiencia',
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontStyle: FontStyle.italic)),
                  ],
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    elevation: 5.0,
                    shadowColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Reservar"),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

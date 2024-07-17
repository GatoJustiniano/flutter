import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

@override
Widget myDrawer({required BuildContext cntx}) {
  return Drawer(
    child: ListView(
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text("Sys4signal"),
          accountEmail: Text(''),
          currentAccountPicture: CircleAvatar(
            radius: 50.0,
            child: Text(
              "A",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        ListTile(
          title: const Text('Cliente'),
          leading: const Icon(Icons.featured_play_list),
          onTap: () {
            Navigator.pop(cntx); // Cierra el Drawer
            cntx.go('/cliente');
          },
        ),
        ListTile(
          title: const Text('Sysnet'),
          leading: const Icon(Icons.description),
          onTap: () {
            Navigator.pop(cntx); // Cierra el Drawer
            cntx.go('/sysnet');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Cerrar Sesión'),
          leading: const Icon(Icons.exit_to_app),
          onTap: () async {
            await _clearPreferencesAndLogout(cntx);
          },
        ),
      ],
    ),
  );
}

Future<void> _clearPreferencesAndLogout(BuildContext cntx) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  cntx.go('/login');
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vrouter/vrouter.dart';

@override
Widget myDrawer({required BuildContext cntx}) {
  return Drawer(
    child: ListView(
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text("Sys4signal"),
          accountEmail: Text(''),
          currentAccountPicture: CircleAvatar(
            // backgroundColor: Colors.blue,
            radius: 50.0,
            // backgroundImage: NetworkImage(
            //     'https://st2.depositphotos.com/22141860/50480/i/1600/depositphotos_504800088-stock-photo-silhouette-adult-young-anonymous-man.jpg'),
            child: Text(
              "A",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        ListTile(
          title: const Text('Cliente'),
          leading: const Icon(Icons.featured_play_list),
          onTap: () async {
            cntx.vRouter.to('/cliente');
          },
        ),
        ListTile(
          title: const Text('Sysnet'),
          leading: const Icon(Icons.description),
          onTap: () async {
            cntx.vRouter.to('/sysnet');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Cerrar Sesión'),
          leading: const Icon(Icons.exit_to_app),
          onTap: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.clear();
            cntx.vRouter.to('/login');
          },
        ),
      ],
    ),
  );
}

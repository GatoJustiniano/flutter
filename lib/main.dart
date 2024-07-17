import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'app_router.dart';

void main() {
  configLoading();
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: myDrawer(cntx: context),
      body: const Center(child: Text('Home Screen')),
    );
  }
}

class ClienteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cliente')),
      body: const Center(child: Text('Cliente Screen')),
    );
  }
}

class SysnetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sysnet')),
      body: const Center(child: Text('Sysnet Screen')),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const Center(child: Text('Login Screen')),
    );
  }
}

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
            context.go('/cliente');
          },
        ),
        ListTile(
          title: const Text('Sysnet'),
          leading: const Icon(Icons.description),
          onTap: () {
            context.go('/sysnet');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Cerrar Sesión'),
          leading: const Icon(Icons.exit_to_app),
          onTap: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.clear();
            context.go('/login');
          },
        ),
      ],
    ),
  );
}

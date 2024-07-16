import 'package:flutter/material.dart';
import 'ui/pages/login/login.dart';
import 'ui/pages/cliente/cliente.dart';
import 'package:vrouter/vrouter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VRouter(
      debugShowCheckedModeBanner: false,
      title: "SYS4SIGNAL",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      initialUrl: '/login',
      routes: [
        //VISTAS PARA NO LOGUEADO
        VGuard(
          beforeEnter: (vRedirector) async {
            //VALIDACION PARA SABER SI ESTA LOGGUEADO
            final prefs = await SharedPreferences.getInstance();
            bool logueado = prefs.getBool('islogged') ?? false;
            if (logueado) {
              vRedirector.to('/cliente');
            }
          },
          stackedRoutes: [
            VWidget(
              path: '/login',
              widget: const LoginScreen(),
            ),
          ],
        ),

        //VISTAS PARA LOGUEADO
        VGuard(
          beforeEnter: (vRedirector) async {
            //VALIDACION PARA SABER SI ESTA LOGGUEADO
            final prefs = await SharedPreferences.getInstance();
            bool logueado = prefs.getBool('islogged') ?? false;
            if (!logueado) {
              vRedirector.to('/login');
            }
          },
          stackedRoutes: [
            VWidget(path: '/cliente', widget: ClienteDash()),
            // VWidget(path: '/sysnet', widget: PieChartPage()),
            VWidget(path: '/login', widget: const LoginScreen()),
          ],
        ),
      ],
    );
  }
}

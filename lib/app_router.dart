import 'package:go_router/go_router.dart';
// Importa el archivo principal donde están definidas tus pantallas

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/cliente',
        builder: (context, state) => ClienteScreen(),
      ),
      GoRoute(
        path: '/sysnet',
        builder: (context, state) => SysnetScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
    ],
  );
}

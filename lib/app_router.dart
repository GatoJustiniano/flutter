import 'package:go_router/go_router.dart';
import 'main.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/cliente',
        builder: (context, state) => const ClienteScreen(),
      ),
      GoRoute(
        path: '/sysnet',
        builder: (context, state) => const SysnetScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
}

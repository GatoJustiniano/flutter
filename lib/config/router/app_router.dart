import 'package:flutter_la_garrita/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';


/// The route configuration.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const CounterScreen(),
    ),
  ],
);

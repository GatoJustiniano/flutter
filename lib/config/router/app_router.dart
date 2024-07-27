import 'package:flutter_la_garrita/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';


/// The route configuration.
final GoRouter appRouter = GoRouter(
  initialLocation: '/buttons',
  routes: [
    GoRoute(
      name: HomeScreen.routeName,
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: ButtonsScreen.routeName,
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      name: CardsScreen.routeName,
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      name: MainOthersScreen.routeName,
      path: '/others',
      builder: (context, state) => const MainOthersScreen(),
    ),
    GoRoute(
      name: CounterScreen.routeName,
      path: '/counters',
      builder: (context, state) => const CounterScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);

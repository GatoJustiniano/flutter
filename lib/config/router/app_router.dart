import 'package:flutter_la_garrita/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

/// The route configuration.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomeScreen.routeName,
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    ...primaryRoutes,
    ...secondaryRoutes,
    ...settingRoutes
  ],
);

final List<GoRoute> settingRoutes = [
  GoRoute(
    path: '/settings',
    name: SettingsScreen.routeName,
    builder: (context, state) => const SettingsScreen(),
  ),
  GoRoute(
    path: '/theme-changer',
    name: ThemeSystemScreen.routeName,
    builder: (context, state) => const ThemeSystemScreen(),
  ),
];

final List<GoRoute> primaryRoutes = [
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
];

final List<GoRoute> secondaryRoutes = [
  GoRoute(
    name: CounterScreen.routeName,
    path: '/counters',
    builder: (context, state) => const CounterScreen(),
  ),
  GoRoute(
    name: CounterRiverpoodScreen.routeName,
    path: '/counters_riverpood',
    builder: (context, state) => const CounterRiverpoodScreen(),
  ),
  GoRoute(
    path: '/progress',
    name: ProgressScreen.routeName,
    builder: (context, state) => const ProgressScreen(),
  ),
  GoRoute(
    path: '/snackbars',
    name: SnackbarScreen.routeName,
    builder: (context, state) => const SnackbarScreen(),
  ),
  GoRoute(
    path: '/animated',
    name: AnimatedScreen.routeName,
    builder: (context, state) => const AnimatedScreen(),
  ),
  GoRoute(
    path: '/ui-controls',
    name: UiControlsScreen.routeName,
    builder: (context, state) => const UiControlsScreen(),
  ),
  GoRoute(
    path: '/tutorial',
    name: AppTutorialScreen.routeName,
    builder: (context, state) => const AppTutorialScreen(),
  ),
  GoRoute(
    path: '/infinite',
    name: InfiniteScrollScreen.routeName,
    builder: (context, state) => const InfiniteScrollScreen(),
  ),
];

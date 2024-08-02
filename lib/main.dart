import 'package:flutter/material.dart';
import 'package:flutter_la_garrita/config/router/app_router.dart';
import 'package:flutter_la_garrita/config/theme/app_theme.dart';
import 'package:flutter_la_garrita/presentation/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
      ProviderScope(
        child: MainApp(),
      ),
    );

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Flutter La Garrita',
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
      routerConfig: appRouter,
    );
  }
}

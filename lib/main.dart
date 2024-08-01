import 'package:flutter/material.dart';
import 'package:flutter_la_garrita/config/router/app_router.dart';
import 'package:flutter_la_garrita/config/theme/app_theme.dart';

void main() => runApp(MaterialApp.router(
      title: 'Flutter La Garrita',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 7).getTheme(),
      routerConfig: appRouter,
    ));

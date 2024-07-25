import 'package:flutter/material.dart';
import 'package:flutter_la_garrita/config/theme/app_theme.dart';
import 'package:flutter_la_garrita/presentation/screens/home/home_screen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 7).getTheme(),
      home: HomeScreen(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hola mundo la garrita'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_la_garrita/presentation/screens/others/counter_screen.dart';
import 'package:go_router/go_router.dart';

class MainOthersScreen extends StatelessWidget {

  static const routeName = 'others';
  
  const MainOthersScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final isColor = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          title: Text('Otras pantallas con funciones'),
        ),
        body: ListTile(
          leading: Icon(
            Icons.play_lesson,
            color: isColor.primary,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: isColor.primary,
          ),
          title: Text(CounterScreen.routeName),
          subtitle: Text('subtitle'),
          onTap: () {
            context.pushNamed(CounterScreen.routeName);
          },
        ));
  }
}

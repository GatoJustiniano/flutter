import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {

  static const routeName = 'buttons_screen';
  
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),

      ),
      body: Text('data'),
    );
  }
}

import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {

  static const routeName = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: Text('cuerpo de la tarjeta'),
    );
  }
}
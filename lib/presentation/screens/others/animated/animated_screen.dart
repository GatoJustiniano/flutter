import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const routeName = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;

  Color color = Colors.black;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();

    width = random.nextInt(300) + 120;
    height = random.nextInt(100) + 120;
    borderRadius = random.nextInt(10) + 20;
    color = Color.fromARGB(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animación de contenedor'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic,
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: Icon(Icons.play_arrow_outlined),
      ),
    );
  }
}

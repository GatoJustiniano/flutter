import 'package:flutter/material.dart';
import 'package:flutter_la_garrita/presentation/widgets/custom_buttom.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  static const routeName = 'counters';

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vista contador'),
        actions: [
          CustomButton(
            icon: Icons.refresh,
            onPressed: () {
              clickCounter = 0;
              setState(() {});
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style: const TextStyle(fontSize: 100),
            ),
            Text('Click${clickCounter == 1 ? '' : 's'}'),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.plus_one,
            onPressed: () {
              clickCounter++;
              setState(() {});
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            icon: Icons.exposure_minus_1_rounded,
            onPressed: () {
              if (clickCounter == 0) return;
              clickCounter--;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}



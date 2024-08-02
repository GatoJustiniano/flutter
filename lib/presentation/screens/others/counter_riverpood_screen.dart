import 'package:flutter/material.dart';
import 'package:flutter_la_garrita/presentation/providers/counter_provider.dart';
import 'package:flutter_la_garrita/presentation/providers/theme_provider.dart';
import 'package:flutter_la_garrita/presentation/widgets/custom_buttom.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterRiverpoodScreen extends ConsumerWidget {
  static const routeName = 'counter_riverpood_screen';

  const CounterRiverpoodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Riverpood'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((status) => !status);
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          'Valor: $clickCounter',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.plus_one,
            onPressed: () {
              ref.read(counterProvider.notifier).state++;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            icon: Icons.exposure_minus_1_rounded,
            onPressed: () {
              if (clickCounter == 0) return;
              ref.read(counterProvider.notifier).state--;
            },
          ),
        ],
      ),
    );
  }
}

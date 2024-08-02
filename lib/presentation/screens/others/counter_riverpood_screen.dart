import 'package:flutter/material.dart';
import 'package:flutter_la_garrita/presentation/providers/counter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class CounterRiverpoodScreen extends ConsumerWidget {

  static const routeName = 'counter_riverpood_screen';


  const CounterRiverpoodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch( counterProvider );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon( Icons.dark_mode_outlined ),
            onPressed: () {
              
            }, 
          )
        ],
      ),

      body: Center(
        child: Text('Valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: (){
          ref.read( counterProvider.notifier ).state++;

        },
      ),
      
    );
  }
}
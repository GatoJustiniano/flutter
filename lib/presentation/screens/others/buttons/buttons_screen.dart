import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const routeName = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 10,
          spacing: 10,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('ElevatedButton')),
            const ElevatedButton(
                onPressed: null, child: Text('ElevatedButtonDisable')),
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text('ElevatedButtonIcon'),
              icon: const Icon(Icons.access_alarm_outlined),
            ),
            FilledButton(onPressed: () {}, child: const Text('FilledButton')),
            FilledButton.icon(
              onPressed: () {},
              label: const Text('FilledButtonIcon'),
              icon: const Icon(Icons.accessibility_new_outlined),
            ),
            OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
            OutlinedButton.icon(
              onPressed: () {},
              label: const Text('OutlinedButtonIcon'),
              icon: const Icon(Icons.accessibility_new_rounded),
            ),
            TextButton(onPressed: () {}, child: const Text('TextButton')),
            TextButton.icon(
              onPressed: () {},
              label: const Text('TextButtonIcon'),
              icon: const Icon(Icons.text_format),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.play_circle_sharp)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.play_circle_sharp),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colors.primary),
                  iconColor: const WidgetStatePropertyAll(Colors.white),
                )),
            const _CustomButton(),
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {
            
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola mundo'),
          ),
        ),
      ),
    );
  }
}

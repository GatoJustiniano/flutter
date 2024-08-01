import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const routeName = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context).clearSnackBars();
    final message = SnackBar(
      content: Text('Mensaje en snackbar! '),
      action: SnackBarAction(
        backgroundColor: colors.primary,
        label: 'Seguro?',
        onPressed: () {},
        textColor: colors.inversePrimary,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbar y dialogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Mostrar Snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: () {
          showCustomSnackbar(context);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      body: _dialogView(),
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

class _dialogView extends StatelessWidget {
  const _dialogView();

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Estás seguro'),
        content: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: () {
              showAboutDialog(
                context: context,
                children: [
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.'),
                ],
              );
            },
            child: Text('Licencias actuales'),
          ),
          SizedBox(height: 20),
          FilledButton.tonal(
            onPressed: () => openDialog(context),
            child: Text('Mostrar diálogo'),
          ),
        ],
      ),
    );
  }
}

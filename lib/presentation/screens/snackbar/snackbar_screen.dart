import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.'),
                ]);
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () {
                openDialog(context: context);
              },
              child: const Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }

  //-------------------------------------------------------------
  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola mundo!!'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  //-------------------------------------------------------------
  void openDialog({required BuildContext context}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Estás seguro?'),
        content: const Text(
            'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }
}

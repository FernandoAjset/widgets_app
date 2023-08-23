import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola, soy un SnackBar personalizado'),
      action: SnackBarAction(
        label: 'Cerrar',
        onPressed: (){}
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBars y Diálogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomSnackBar(context);
        },
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}

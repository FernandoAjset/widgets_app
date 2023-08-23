import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola, soy un SnackBar personalizado'),
      action: SnackBarAction(label: 'Cerrar', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('¿Estas seguro?'),
              content: const Text(
                  'Culpa culpa velit velit aute sit et. Deserunt proident occaecat adipisicing tempor magna voluptate anim aliqua ipsum reprehenderit fugiat nisi proident elit. Lorem elit mollit cillum esse nostrud consectetur culpa id eu esse. Labore aute ad et labore do cillum labore occaecat est do. Aliqua irure nostrud aute cupidatat aliquip adipisicing mollit laboris fugiat ut magna quis exercitation fugiat.'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cerrar')),
                FilledButton(onPressed: () {}, child: const Text('Aceptar'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBars y Diálogos'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton.tonal(
            onPressed: () {
              showAboutDialog(context: context, children: [
                const Text(
                    'Anim consequat anim elit cupidatat consequat cillum non esse nisi qui eiusmod ipsum dolore. Exercitation magna cupidatat ad sint aliquip amet aute qui aliqua adipisicing cupidatat laboris. Do do consectetur commodo aliqua quis pariatur officia sunt duis voluptate irure voluptate. Ex eu duis sint proident et esse reprehenderit mollit dolor consectetur sint occaecat irure mollit. Exercitation sint proident quis mollit aliqua fugiat magna eu ad laborum dolore ut.')
              ]);
            },
            child: const Text('Licencias usadas'),
          ),
          FilledButton.tonal(
            onPressed: () {
              openDialog(context);
            },
            child: const Text('Mostrar diálogo'),
          )
        ]),
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

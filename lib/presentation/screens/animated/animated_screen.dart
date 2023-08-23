import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.blue;
  double borderRadius = 10;

  void changeShape() {
    final random = Random();
    // Generación de valores random para width, height y borderRadius
    var randomWidth = random.nextInt(300).toDouble() + 120;
    var randomHeigth = random.nextInt(300).toDouble() + 120;
    var randomBorderRadius = random.nextInt(40).toDouble() + 20;

    // Validación y asignación de valores random para width, height y borderRadius
    width = randomWidth <= 0 ? 50 : randomWidth;
    height = randomHeigth <= 0 ? 50 : randomHeigth;
    borderRadius = randomBorderRadius <= 0 ? 10 : randomBorderRadius;

    // Generación de valores random para color
    var randomRedValue = random.nextInt(255);
    var randomGreenValue = random.nextInt(255);
    var randomBlueValue = random.nextInt(255);

    // Validación y asignación de valores random para color
    color = Color.fromRGBO(
      randomRedValue <= 0 ? 0 : randomRedValue, // Red
      randomGreenValue <= 0 ? 0 : randomGreenValue, // Green
      randomBlueValue <= 0 ? 0 : randomBlueValue, // Blue
      1, // Opacity
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: changeShape, child: const Icon(Icons.play_arrow_outlined)),
      body: Center(
          child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.elasticOut,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      )),
    );
  }
}

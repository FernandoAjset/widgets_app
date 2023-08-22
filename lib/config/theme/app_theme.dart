import 'package:flutter/material.dart';

List<Color> colors = [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colors.length,
            'Selected color must be less or equal than ${colors.length - 1}');

  ThemeData getTheme() =>
      ThemeData(
        useMaterial3: true, 
        colorSchemeSeed: colors[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: true
        )
        );
}

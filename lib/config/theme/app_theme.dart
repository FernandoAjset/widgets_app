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
  final int selectedColorIndex;
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false, this.selectedColorIndex = 0})
      : assert(
            selectedColorIndex >= 0, 'Selected color must be greater then 0'),
        assert(selectedColorIndex < colors.length,
            'Selected color must be less or equal than ${colors.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colors[selectedColorIndex],
      appBarTheme: const AppBarTheme(centerTitle: true));

  AppTheme copyWith({int? selectedColorIndex, bool? isDarkMode}) {
    return AppTheme(
        selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
        isDarkMode: isDarkMode ?? this.isDarkMode);
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => false);

// Listado de colores inmutable
final colorListProvider = StateProvider((ref) => colors);

// Color seleccionado
final selectedColorIndexProvider =
    StateProvider((ref) => colors.indexOf(colors.first));

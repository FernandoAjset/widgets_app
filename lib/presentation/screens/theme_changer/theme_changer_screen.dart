import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../counter/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme-charger';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDark = ref.watch(isDarkModeProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Theme Changer with provider'),
          actions: [
            IconButton(
                onPressed: () {
                  ref
                      .read(isDarkModeProvider.notifier)
                      .update((state) => !state);
                },
                icon: isDark
                    ? const Icon(Icons.light_mode_outlined)
                    : const Icon(Icons.dark_mode_outlined))
          ],
        ),
        body: const _ThemeChangerView());
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColorIndex = ref.watch(selectedColorIndexProvider);

    return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final Color color = colors[index];

          return RadioListTile(
              title: Text(
                'Color $index',
                style: TextStyle(color: color),
              ),
              subtitle: Text('${color.value}'),
              activeColor: color,
              value: index,
              groupValue: selectedColorIndex,
              onChanged: (value) {
                ref
                    .read(selectedColorIndexProvider.notifier)
                    .update((state) => value ?? 0);
              });
        });
  }
}

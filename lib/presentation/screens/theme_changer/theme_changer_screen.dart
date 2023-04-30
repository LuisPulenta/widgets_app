import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_changer_screen';

  const ThemeChangerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkmode = ref.watch(themeNotifierProvider).isDarkmode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: isDarkmode
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined),
              onPressed: () {
                //ref.read(isDarkmodeProvider.notifier).state = !ref.read(isDarkmodeProvider.notifier).state;
                ref.read(themeNotifierProvider.notifier).toggleDarMode();
              }),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

//------------------------------------------------------
//----------------- _ThemeChangerView ------------------
//------------------------------------------------------
class _ThemeChangerView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);

    //final int selectedColor = ref.watch(selectedColorProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text(
            'Este color',
            style: TextStyle(color: color),
          ),
          subtitle: Text('${color.value}', style: TextStyle(color: color)),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            ref.watch(themeNotifierProvider.notifier).changeColorIndex(index);
          },
        );
      },
    );
  }
}

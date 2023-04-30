import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/themes/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bool isDarkmode = ref.watch(isDarkmodeProvider);
    // final int selectedColor = ref.watch(selectedColorProvider);

    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      // theme: AppTheme(selectedColor: selectedColor, isDarkmode: isDarkmode).getTheme(),
      theme: appTheme.getTheme(),

      title: 'Widgets App',

      // home: const HomeScreen(),
      // routes: {
      //   '/buttons': (context) => const ButtonsScreen(),
      //   '/cards': (context) => const CardsScreen(),
      // },
    );
  }
}

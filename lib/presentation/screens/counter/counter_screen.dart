import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';

  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isValid = ref.watch(boolProvider);
    final String name = ref.watch(stringProvider);
    final bool isDarkmode = ref.watch(isDarkmodeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Counter'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: isDarkmode
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined),
              onPressed: () {
                ref.read(isDarkmodeProvider.notifier).state = !isDarkmode;
              }),
        ],
      ),
      body: Center(
        child: Text('Valor: $clickCounter $isValid $name',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            ref.read(counterProvider.notifier).state++;
            ref.read(boolProvider.notifier).state =
                !ref.read(boolProvider.notifier).state;
            ref.read(stringProvider.notifier).state =
                ref.read(stringProvider.notifier).state + 'x';
            //ref.read(counterProvider.notifier).update((state) => state + 1);
          }),
    );
  }
}

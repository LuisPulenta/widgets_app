import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';

  const ProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
        centerTitle: true,
      ),
      body: const _ProgressView(),
    );
  }
}

//---------------------------------------------------------
class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text('Circular Progress Indicator'),
          const SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(
              strokeWidth: 2, backgroundColor: colors.inversePrimary),
          const SizedBox(
            height: 10,
          ),
          const Text('Progress Indicator controlado'),
          const SizedBox(
            height: 10,
          ),
          const _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

//------------------------------------------------------------
class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          print(value * 2 / 100);
          return (value * 2 / 100);
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                    value: progressValue,
                    strokeWidth: 2,
                    backgroundColor: Colors.black12),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: LinearProgressIndicator(
                        value: progressValue, backgroundColor: Colors.black12)),
              ],
            ),
          );
        });
  }
}

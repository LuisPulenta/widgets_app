import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';

  const ProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProgressScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('ProgressScreen'),
      ),
    );
  }
}

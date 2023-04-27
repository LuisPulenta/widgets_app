import 'package:flutter/material.dart';

class AppTutorialScreen extends StatelessWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppTutorialScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('AppTutorialScreen'),
      ),
    );
  }
}

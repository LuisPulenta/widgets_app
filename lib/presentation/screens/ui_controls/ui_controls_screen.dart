import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UiControlsScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('UiControlsScreen'),
      ),
    );
  }
}

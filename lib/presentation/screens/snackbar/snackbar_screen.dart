import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackbarScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('SnackbarScreen'),
      ),
    );
  }
}

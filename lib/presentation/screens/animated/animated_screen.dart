import 'package:flutter/material.dart';

class AnimatedScreen extends StatelessWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('AnimatedScreen'),
      ),
    );
  }
}

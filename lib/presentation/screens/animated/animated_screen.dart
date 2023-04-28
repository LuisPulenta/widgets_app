import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  //--------------------------------------------------------
  //--------------------- Variables ------------------------
  //--------------------------------------------------------

  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          curve: Curves.elasticInOut,
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  //-----------------------------------------------------
  //--------------------- changeShape -------------------
  //-----------------------------------------------------
  void changeShape() {
    final random = Random();

    width = random.nextInt(300) + 50;
    height = random.nextInt(300) + 50;
    borderRadius = random.nextInt(50) + 10.0;
    color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);

    setState(() {});
  }
}

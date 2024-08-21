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
  double borderRadius = 30.0;

  double width2 = 50;
  double height2 = 50;
  Color color2 = Colors.indigo;
  double borderRadius2 = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: width <= 0 ? 0 : width,
              height: height <= 0 ? 0 : height,
              decoration: BoxDecoration(
                color: color,
                borderRadius:
                    BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: width2 <= 0 ? 0 : width2,
              height: height2 <= 0 ? 0 : height2,
              decoration: BoxDecoration(
                color: color2,
                borderRadius: BorderRadius.circular(
                    borderRadius2 <= 0 ? 0 : borderRadius2),
              ),
            ),
          ],
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

    width2 = random.nextInt(300) + 50;
    height2 = random.nextInt(300) + 50;
    borderRadius2 = random.nextInt(50) + 10.0;
    color2 = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);

    setState(() {});
  }
}

import 'package:flutter/material.dart';

class InfiniteScrollScreen extends StatelessWidget {
  static const String name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InfiniteScrollScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('InfiniteScrollScreen'),
      ),
    );
  }
}

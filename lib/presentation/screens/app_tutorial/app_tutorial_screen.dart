import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Commodo pariatur pariatur eiusmod nisi reprehenderit ullamco proident in reprehenderit pariatur mollit.',
      'assets/1.png'),
  SlideInfo(
      'Entrega rápida',
      'Laborum ut duis excepteur exercitation aliqua ad veniam mollit Lorem aliquip.',
      'assets/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Id proident cupidatat duis sunt incididunt dolore excepteur nulla aute labore officia aute.',
      'assets/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({Key? key}) : super(key: key);

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
//---------------------------------------------------------
//-------------------- Variables --------------------------
//---------------------------------------------------------
  PageController pageController = PageController();
  bool endReached = false;

//---------------------------------------------------------
//-------------------- initState --------------------------
//---------------------------------------------------------

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final page = pageController.page ?? 0;
      if (!endReached && page >= slides.length - 1.5) {
        endReached = true;
        setState(() {});
      } else {
        endReached = false;
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

//---------------------------------------------------------
//-------------------- Pantalla ---------------------------
//---------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            ),
          ),
          endReached
              ? Positioned(
                  right: 20,
                  bottom: 50,
                  child: FadeInRight(
                    duration: const Duration(milliseconds: 400),
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      child: const Text('Comenzar'),
                      onPressed: () => context.pop(),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

//---------------------------------------------------------

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

//---------------------------------------------------------

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imageUrl),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}

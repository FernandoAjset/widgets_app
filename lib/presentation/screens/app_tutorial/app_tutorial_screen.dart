import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String description;
  final String imagePath;

  const SlideInfo(
      {required this.title,
      required this.description,
      required this.imagePath});
}

final slides = <SlideInfo>[
  const SlideInfo(
      title: 'Busca la comida',
      description: 'Selecciona tu comida favorita',
      imagePath: 'assets/Images/1.png'),
  const SlideInfo(
      title: 'Entrega rapida',
      description: 'Entrega rapida a tu puerta',
      imagePath: 'assets/Images/2.png'),
  const SlideInfo(
      title: 'Disfruta la comida',
      description: 'Disfruta de la comida en tu casa',
      imagePath: 'assets/Images/3.png')
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final pageViewController = PageController();
  bool endPage = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endPage && page >= (slides.length - 1.5)) {
        setState(() {
          endPage = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children:
                  slides.map((slideData) => _Slide(slide: slideData)).toList(),
            ),
            Positioned(
                right: 20,
                top: 50,
                child: TextButton(
                  child: const Text('Skip tutorial'),
                  onPressed: () => context.pop(),
                )),
            endPage
                ? Positioned(
                    bottom: 30,
                    right: 30,
                    child: FadeInRight(
                      from: 15,
                      delay: const Duration(microseconds: 650),
                      child: FilledButton(
                        child: const Text('Comenzar'),
                        onPressed: () => context.go('/'),
                      ),
                    ))
                : const SizedBox(
                    height: 0,
                  )
          ],
        ));
  }
}

class _Slide extends StatelessWidget {
  final SlideInfo slide;
  const _Slide({required this.slide});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(slide.imagePath)),
            const SizedBox(
              height: 20,
            ),
            Text(
              slide.title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              slide.description,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}

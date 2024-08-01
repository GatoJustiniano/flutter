import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Busca la comida',
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'Entrega la comida',
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'Disfruta la comida',
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
      imageUrl: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const routeName = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageView = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageView.addListener(
      () {
        final page = pageView.page ?? 0;
        if (!endReached && page >= (slides.length - 1.5)) {
          setState(() {
            endReached = true;
          });
        }
        print('${pageView.page}');
      },
    );
  }

  @override
  void dispose() {
    pageView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageView,
            physics: BouncingScrollPhysics(),
            children: slides
                .map((item) => _Slide(
                    title: item.title,
                    caption: item.caption,
                    imageUrl: item.imageUrl))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: Text('Salir'),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: Duration(seconds: 2),
                    child: FilledButton(
                      onPressed: () {},
                      child: Text('Comenzar'),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

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
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imageUrl)),
          SizedBox(height: 20),
          Text(
            title,
            style: titleStyle,
          ),
          SizedBox(height: 10),
          Text(
            caption,
            style: captionStyle,
          )
        ],
      ),
    );
  }
}

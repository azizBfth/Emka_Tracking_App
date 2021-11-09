import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PicturesSlider extends StatefulWidget {
  const PicturesSlider({Key? key}) : super(key: key);

  @override
  _PicturesSliderState createState() => _PicturesSliderState();
}

class _PicturesSliderState extends State<PicturesSlider> {
  final pictures = [
    'assets/images/trackAssets.png',
    'assets/images/trackAssets1.png',
    'assets/images/LED.png',
    'assets/images/LEDBUS.png',
    'assets/images/LCD.png',
    'assets/images/GPS.png',
    'assets/images/GAUGE.png',
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: pictures.length,
              itemBuilder: (context, index, realIndex) {
                final picture = pictures[index];
                return buildPicture(picture, index);
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.2,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            buildIndicator(),
          ],
        ));
  }

  Widget buildPicture(String picture, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.transparent,
      child: Image.asset(picture));
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: pictures.length,
        effect: SlideEffect(
            activeDotColor: Colors.yellow,
            dotColor: Colors.black87,
            dotHeight: 8,
            dotWidth: 8),
      );
}

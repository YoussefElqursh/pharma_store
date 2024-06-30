import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/styles/colors.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({Key? key}) : super(key: key);

  @override
  HomeCarouselState createState() => HomeCarouselState();
}

class HomeCarouselState extends State<HomeCarousel> {
  final CarouselController controller = CarouselController();
  final List<String> imgList = [
    'assets/images/1.png',
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/2.png',
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imgList.map((imagePath) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            );
          }).toList(),
          carouselController: controller,
          options: CarouselOptions(
            height: 130,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 1,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                current = index;
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        AnimatedSmoothIndicator(

          activeIndex: current,
          count: imgList.length,
          effect: ExpandingDotsEffect(
            dotWidth: 15.0,
            dotHeight: 4.0,
            activeDotColor: HexColor(primaryColor),
            spacing: 6,
            dotColor: HexColor(placeholder),
          ),
          onDotClicked: (index) {
            controller.animateToPage(index);
          },
        ),
      ],
    );
  }
}


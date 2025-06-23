import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BookCarousel extends StatefulWidget {
  const BookCarousel({super.key});

  @override
  State<BookCarousel> createState() => _BookCarouselState();
}

class _BookCarouselState extends State<BookCarousel> {
  final CarouselController _carouselController = CarouselController();
  int _currentPage = 0;

  final List<String> _imgList = [
    'assets/images/carousel_1.png',
    'assets/images/carousel_2.png',
    'assets/images/carousel_3.png',
    'assets/images/carousel_4.png',
    'assets/images/carousel_5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              items: _imgList.map((url) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    url,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
              carouselController: null,
              options: CarouselOptions(
                height: 220,
                viewportFraction: 1.0,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
            ),
            // Left arrow
            Positioned(
              left: 8,
              top: 0,
              bottom: 0,
              // child: Center(
              child: GestureDetector(
                onTap: () {
                  _carouselController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                // child: Container(
                //   padding: const EdgeInsets.all(8),
                //   decoration: const BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: Color(0xFFD1F2FF),
                //   ),
                //   child: const Icon(Icons.arrow_back_ios_new, size: 16),
                // ),
                // ),
              ),
            ),
            // Right arrow
            Positioned(
              right: 8,
              top: 0,
              bottom: 0,
              // child: Center(
              child: GestureDetector(
                onTap: () {
                  _carouselController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                // child: Container(
                //   padding: const EdgeInsets.all(8),
                //   decoration: const BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: Color(0xFFD1F2FF),
                //   ),
                //   child: const Icon(Icons.arrow_forward_ios, size: 16),
                // ),
                // ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () {
                _carouselController.animateToPage(
                  entry.key,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == entry.key
                      ? Colors.blue
                      : Colors.grey.shade400,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

extension on CarouselController {
  void previousPage({required Duration duration, required Cubic curve}) {}

  void nextPage({required Duration duration, required Cubic curve}) {}

  void animateToPage(int key,
      {required Duration duration, required Cubic curve}) {}
}

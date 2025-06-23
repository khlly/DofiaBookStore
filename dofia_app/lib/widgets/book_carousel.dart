import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BookCarousel extends StatefulWidget {
  const BookCarousel({super.key});

  @override
  State<BookCarousel> createState() => _BookCarouselState();
}

class _BookCarouselState extends State<BookCarousel> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
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
        SizedBox(
          height: 220,
          child: Stack(
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
                carouselController: _carouselController,
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
              ),

              // Arrow gauche
              Positioned(
                left: 8,
                top: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    _carouselController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Icon(Icons.arrow_back_ios_new, size: 16),
                ),
              ),

              // Arrow droite
              Positioned(
                right: 8,
                top: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    _carouselController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () {
                _carouselController.animateTo(
                  entry.key.toDouble(),
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

extension on CarouselSliderController {
  void animateTo(double double,
      {required Duration duration, required Cubic curve}) {}
}

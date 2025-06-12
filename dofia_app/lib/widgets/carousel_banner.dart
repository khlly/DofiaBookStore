import 'package:flutter/material.dart';

class BookCarousel extends StatefulWidget {
  const BookCarousel({super.key, required List<String> books});

  @override
  State<BookCarousel> createState() => _BookCarouselState();
}

class _BookCarouselState extends State<BookCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _images = [
    'assets/banner1.jpg',
    'assets/banner2.jpg',
    'assets/banner3.jpg',
  ];

  void _goToPage(int index) {
    if (index >= 0 && index < _images.length) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Banner Carousel
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                _images[index],
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              );
            },
          ),
        ),

        // Left Arrow
        Positioned(
          left: 8,
          child: GestureDetector(
            onTap: () => _goToPage(_currentPage - 1),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD1F2FF),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.arrow_back_ios_new, size: 16),
            ),
          ),
        ),

        // Right Arrow
        Positioned(
          right: 8,
          child: GestureDetector(
            onTap: () => _goToPage(_currentPage + 1),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD1F2FF),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
        ),

        // Page Indicator
        Positioned(
          bottom: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_images.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: _currentPage == index ? 10 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blue : Colors.grey[400],
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

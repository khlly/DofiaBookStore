import 'package:dofia_the_book/widgets/book_carousel.dart';
import 'package:flutter/material.dart';
import 'package:dofia_the_book/widgets/Product_Carousel.dart';
import '../data/Allproduct_data.dart';

class HomeScreenGuest extends StatefulWidget {
  const HomeScreenGuest({super.key});

  @override
  State<HomeScreenGuest> createState() => _HomeScreenGuestState();
}

class _HomeScreenGuestState extends State<HomeScreenGuest> {
// Default selected index

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color(0xFFE0F7FF),
        child: Column(
          children: [
            // const WelcomeMessage(),
            // const custom.SearchBar(),
            // const BookCarousel(),
            ProductCarousel(title: 'All Products', books: books),
            ProductCarousel(title: 'Popular Books', books: popularBooks),
            ProductCarousel(title: 'Discounted Deals', books: discountedBooks),
            ProductCarousel(title: 'Hot Genre: Fantasy', books: hotGenreBooks),
            ProductCarousel(title: 'New Arrivals', books: latestBooks),
            const BookCarousel(),
          ],
        ),
      ),
    );
  }
}

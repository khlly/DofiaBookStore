import 'package:dofia_the_book/widgets/book_carousel.dart';
import 'package:flutter/material.dart';
import 'package:dofia_the_book/widgets/Product_Carousel.dart';
import '../data/Allproduct_data.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onGoToCart;
  final VoidCallback onGoToFavorite;

  const HomeScreen(
      {super.key, required this.onGoToCart, required this.onGoToFavorite});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// Default selected index

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color(0xFFE0F7FF),
        child: Column(
          children: [
            ProductCarousel(
              title: 'All Products',
              books: books,
              onGoToCart: widget.onGoToCart,
              onGoToFavorite: widget.onGoToFavorite,
            ),
            ProductCarousel(
                title: 'Popular Books',
                books: popularBooks,
                onGoToCart: widget.onGoToCart,
                onGoToFavorite: widget.onGoToFavorite),
            ProductCarousel(
                title: 'Discounted Deals',
                books: discountedBooks,
                onGoToCart: widget.onGoToCart,
                onGoToFavorite: widget.onGoToFavorite),
            ProductCarousel(
              title: 'Hot Genre: Fantasy',
              books: hotGenreBooks,
              onGoToCart: widget.onGoToCart,
              onGoToFavorite: widget.onGoToFavorite,
            ),
            ProductCarousel(
              title: 'New Arrivals',
              books: latestBooks,
              onGoToCart: widget.onGoToCart,
              onGoToFavorite: widget.onGoToFavorite,
            ),
            const BookCarousel(),
          ],
        ),
      ),
    );
  }
}

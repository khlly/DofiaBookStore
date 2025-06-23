import 'package:flutter/material.dart';
import 'Book_card_carousel.dart';

class ProductCarousel extends StatelessWidget {
  final dynamic title;
  final dynamic books;

  final VoidCallback onGoToCart;
  final VoidCallback onGoToFavorite;

  const ProductCarousel(
      {required this.title,
      required this.books,
      super.key,
      required this.onGoToCart,
      required this.onGoToFavorite});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      constraints: const BoxConstraints(maxHeight: 350),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              title,
              textDirection: TextDirection.ltr,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BookCardCarousel(
                    imagePath: book.imagePath,
                    title: book.title,
                    author: book.author,
                    publishDate: book.publishDate,
                    category: book.category,
                    price: book.price,
                    OnGoToFavorite: onGoToFavorite,
                    OnGoToCart: onGoToCart,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

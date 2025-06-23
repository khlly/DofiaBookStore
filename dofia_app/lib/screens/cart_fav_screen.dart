import 'package:dofia_the_book/data/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_fav_widget.dart';

class CartFavScreen extends StatefulWidget {
  const CartFavScreen({super.key});

  @override
  State<CartFavScreen> createState() => _CartFavScreenState();
}

class _CartFavScreenState extends State<CartFavScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteBooks = context.watch<BookProvider>().favoriteBooks;

    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: favoriteBooks.isEmpty
          ? const Center(child: Text("No favorites yet."))
          : ListView.builder(
              padding: const EdgeInsets.only(bottom: 100),
              itemCount: favoriteBooks.length,
              itemBuilder: (context, index) {
                final book = favoriteBooks[index];
                return CartFavWidget(book: book);
              },
            ),
    );
  }
}

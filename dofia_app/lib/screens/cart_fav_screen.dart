import 'package:dofia_the_book/widgets/book_carousel.dart';
import 'package:dofia_the_book/widgets/cart_fav_widget.dart';
import 'package:flutter/material.dart';

class CartFavScreen extends StatefulWidget {
  const CartFavScreen({super.key});

  @override
  State<CartFavScreen> createState() => _CartFavScreenState();
}

class _CartFavScreenState extends State<CartFavScreen> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
         BookCarousel(),
          CartFavWidget(),
                  CartFavWidget(),
          CartFavWidget(),
          CartFavWidget(),
      
        ],
      ),
    );
  }
}
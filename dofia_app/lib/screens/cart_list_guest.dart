import 'package:dofia_the_book/widgets/book_carousel.dart';
import 'package:dofia_the_book/widgets/cart_listing_guest_widget.dart';
import 'package:flutter/material.dart';

class CartListGuest extends StatefulWidget {
  const CartListGuest({super.key});

  @override
  State<CartListGuest> createState() => _CartListGuestState();
}

class _CartListGuestState extends State<CartListGuest> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
      

          BookCarousel(),
          CartListingGuestWidget(),
                  CartListingGuestWidget(),
          CartListingGuestWidget(),
          CartListingGuestWidget(),
          CartListingGuestWidget(),
          CartListingGuestWidget(),
      
        ],
      ),
    );
  }
}
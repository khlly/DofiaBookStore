import 'package:dofia_the_book/widgets/orderStatuses/card_status_widget.dart';
import 'package:flutter/material.dart';

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('My Order')),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          OrderStatusWidget(
              currentStep:
                  2), // For example, currently at "Delivering/Shipping"
          // You can follow up with your order list here
        ],
      ),
    ),
  );
}

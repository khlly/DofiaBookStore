import 'package:dofia_the_book/screens/orderStatus/order_status.dart';
import 'package:dofia_the_book/widgets/cart_listing_widget.dart';
import 'package:flutter/material.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward),
            tooltip: 'See my order',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrderStatusScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CartListWidget(),
            // tu peux ajouter ici un bouton "Voir mes commandes" aussi si tu veux
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => const OrderStatusScreen()));
            //   },
            //   child: Text('Voir mes commandes'),
            // ),
          ],
        ),
      ),
    );
  }
}

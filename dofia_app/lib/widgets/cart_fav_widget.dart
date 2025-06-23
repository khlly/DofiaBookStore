import 'package:flutter/material.dart';

class CartFavWidget extends StatelessWidget {
  const CartFavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Container(
        height: 144,
        decoration: BoxDecoration(
          color: Color(0xFFD0E8EE),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 251, 250, 250).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 13,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    'assets/images/book_covers/Atomic-habit-bookCover.png',
                    width: 60,
                    height: 90),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Atomic Habits",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Motivation, Self-help",
                      style: TextStyle(
                          color: Color(0xFF00637C),
                          fontSize: 10,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Paper Base Edition",
                      style: TextStyle(
                          color: Color(0xFF00637C),
                          fontSize: 10,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Price: \$15.50",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Total: \$31.00",
                      style: TextStyle(
                          color: Color(0xFF00637C),
                          fontSize: 15,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                Text(
                  "x2",
                  style: TextStyle(
                      color: Color(0xFF00637C),
                      fontSize: 25,
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 144,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     
                      IconButton(
                        iconSize: 24,
                        splashRadius: 24,
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.all(2),
                        onPressed: () {},
                        icon: Icon(Icons.delete_outline, color: Colors.red),
                      ),

                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
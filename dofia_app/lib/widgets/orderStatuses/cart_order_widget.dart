import 'package:flutter/material.dart';
import 'package:dofia_the_book/models/book_model.dart';

class CartOrderWidget extends StatelessWidget {
  final BookItem book;

  const CartOrderWidget({Key? key, required this.book}) : super(key: key);

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
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  book.imagePath,
                  width: 60,
                  height: 90,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 13),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      book.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'inter',
                      ),
                    ),
                    Text(
                      "${book.category}, ${book.author}",
                      style: TextStyle(
                        color: Color(0xFF00637C),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'inter',
                      ),
                    ),
                    Text(
                      "Edition: ${book.edition}",
                      style: TextStyle(
                        color: Color(0xFF00637C),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'inter',
                      ),
                    ),
                    Text(
                      "Price: \$${book.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'inter',
                      ),
                    ),
                    Text(
                      "Total: \$${(book.price * book.quantity).toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Color(0xFF00637C),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'inter',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "x${book.quantity}",
              style: TextStyle(
                color: Color(0xFF00637C),
                fontSize: 25,
                fontFamily: 'inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            // Tu peux ajouter des boutons ici si tu veux modifier la quantité ou supprimer
          ],
        ),
      ),
    );
  }
}

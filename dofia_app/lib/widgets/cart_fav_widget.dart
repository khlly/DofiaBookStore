import 'package:dofia_the_book/data/book_provider.dart';
import 'package:dofia_the_book/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartFavWidget extends StatelessWidget {
  final BookItem book;
  final VoidCallback? onRemove;

  const CartFavWidget({
    super.key,
    required this.book,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Container(
        height: 144,
        decoration: BoxDecoration(
          color: const Color(0xFFD0E8EE),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(book.imagePath, width: 60, height: 90),
                const SizedBox(width: 13),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(book.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    Text(book.category, style: const TextStyle(fontSize: 10, color: Color(0xFF00637C))),
                    Text(book.edition, style: const TextStyle(fontSize: 10, color: Color(0xFF00637C))),
                    Text("Price: \$${book.price.toStringAsFixed(2)}", style: const TextStyle(fontSize: 15)),
                    Text("Total: \$${book.total.toStringAsFixed(2)}", style: const TextStyle(fontSize: 15, color: Color(0xFF00637C))),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("x${book.quantity}", style: const TextStyle(fontSize: 25, color: Color(0xFF00637C))),
                IconButton(
                  onPressed: onRemove ??
                      () {
                        Provider.of<BookProvider>(context, listen: false).removeFromFavorites(book);
                      },
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dofia_the_book/models/book_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<BookItem> _cartItems = [];

  List<BookItem> get cartItems => List.unmodifiable(_cartItems);

  void addToCart(BookItem book) {
    // Si le livre est déjà dans le panier, on augmente la quantité
    final index = _cartItems.indexWhere((item) => item.title == book.title);
    if (index >= 0) {
      _cartItems[index].quantity += book.quantity;
    } else {
      _cartItems.add(book);
    }
    notifyListeners();
  }

  void removeFromCart(BookItem book) {
    _cartItems.removeWhere((item) => item.title == book.title);
    notifyListeners();
  }

  void incrementQuantity(BookItem book) {
    final index = _cartItems.indexWhere((item) => item.title == book.title);
    if (index >= 0) {
      _cartItems[index].quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(BookItem book) {
    final index = _cartItems.indexWhere((item) => item.title == book.title);
    if (index >= 0 && _cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
      notifyListeners();
    }
  }

  double get totalPrice {
    double total = 0;
    for (var book in _cartItems) {
      total += book.price * book.quantity;
    }
    return total;
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

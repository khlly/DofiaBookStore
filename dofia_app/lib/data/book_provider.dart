import 'package:dofia_the_book/models/book_model.dart';
import 'package:flutter/material.dart';

class BookProvider with ChangeNotifier {
  final List<BookItem> _items = [];

  List<BookItem> get items => List.unmodifiable(_items);
  final List<BookItem> _favoriteBooks = [];

  List<BookItem> get favoriteBooks => _favoriteBooks;

void addToFavorites(BookItem book) {
    if (!_favoriteBooks.contains(book)) {
      _favoriteBooks.add(book);
      notifyListeners();
    }
  }

  void removeFromFavorites(BookItem book) {
    _favoriteBooks.remove(book);
    notifyListeners();
  }

  bool isFavorite(BookItem book) {
    return _favoriteBooks.contains(book);
  }

  void increment(BookItem book) {
    book.quantity++;
    notifyListeners();
  }

  void decrement(BookItem book) {
    if (book.quantity > 1) {
      book.quantity--;
      notifyListeners();
    }
  }
}

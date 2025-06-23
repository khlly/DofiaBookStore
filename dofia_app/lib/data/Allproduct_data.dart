import 'package:dofia_the_book/models/book_model.dart';

final List<BookItem> allBooks  = [
  BookItem(
    imagePath: 'assets/images/book_covers/Atomic-habit-bookCover.png',
    title: 'Atomic Habits',
    author: 'Author A',
    publishDate: '2018',
    category: 'Fiction',
    price: 12.99,
  ),

  BookItem(
    imagePath: 'assets/images/book_covers/alchemist.JPG',
    title: 'The Alchemist',
    author: 'Author B',
    publishDate: '2018',
    category: 'Fantasy',
    price: 15.49,
  ),

  BookItem(
    imagePath: 'assets/images/book_covers/Hobbit.png',
    title: 'Hobbit',
    author: 'Author C',
    publishDate: '2018',
    category: 'Mystery',
    price: 10.00,
  ),

  BookItem(
    imagePath: 'assets/images/book_covers/Lion_Witch_Wardrobe.png',
    title: 'Narnia',
    author: 'Author D',
    publishDate: '2018',
    category: 'Romance',
    price: 18.20,
  ),

  BookItem(
    imagePath: 'assets/images/book_covers/George_Orwell_1984.png',
    title: 'Book 5',
    author: 'Author E',
    publishDate: '2018',
    category: 'Sci-fi',
    price: 9.99,
  ),
];

final List<BookItem> books =  allBooks;

final List<BookItem> popularBooks =
    allBooks.where((book) => book.title.contains('1') || book.title.contains('3')).toList();

final List<BookItem> discountedBooks =
    allBooks.where((book) => book.price < 11.0).toList();

final List<BookItem> hotGenreBooks =
    allBooks.where((book) => book.category == 'Fantasy').toList();

final List<BookItem> latestBooks = allBooks.take(5).toList(); // ou trie par date si besoin

import '../widgets/Book_card_carousel.dart';

final List<BookCardCarousel> books = [
  const BookCardCarousel(
      imagePath: 'assets/images/Atomic-habit-bookCover.png',
      title: 'Book 1',
      author: 'Author A',
      publishDate: '2018',
      category: 'Fiction',
      price: 12.99),
  const BookCardCarousel(
      imagePath: 'assets/images/Atomic-habit-bookCover.png',
      title: 'Book 2',
      author: 'Author B',
      publishDate: '2018',
      category: 'Fantasy',
      price: 15.49),
  const BookCardCarousel(
      imagePath: 'assets/images/Atomic-habit-bookCover.png',
      title: 'Book 3',
      author: 'Author C',
      publishDate: '2018',
      category: 'Mystery',
      price: 10.00),
  const BookCardCarousel(
      imagePath: 'assets/images/Atomic-habit-bookCover.png',
      title: 'Book 4',
      author: 'Author D',
      publishDate: '2018',
      category: 'Romance',
      price: 18.20),
  const BookCardCarousel(
      imagePath: 'assets/images/Atomic-habit-bookCover.png',
      title: 'Book 5',
      author: 'Author E',
      publishDate: '2018',
      category: 'Sci-fi',
      price: 9.99),
];

// Filtered data
final popularBooks = books.where((book) => book.isFavorite).toList();
final discountedBooks = books.where((book) => book.isDiscounted).toList();
final hotGenreBooks =
    books.where((book) => book.category == 'Fantasy').toList();
final latestBooks = books.take(5).toList(); // or by publishDate

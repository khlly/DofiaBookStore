class BookItem {
  final String title;
  final String category;
  final String edition;
  final String imagePath;
  final double price;
  final String author;
  final String publishDate;
  int quantity;

  BookItem({
    required this.title,
    required this.category,
    required this.author,
    required this.publishDate,
    required this.imagePath,
    required this.price,
    this.quantity = 1,
    this.edition = "Hachette",
  });

  double get total => price * quantity;
}

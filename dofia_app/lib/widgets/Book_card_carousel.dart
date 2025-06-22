import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/user_provider.dart';
import '../screens/auth/login_screen.dart';

class BookCardCarousel extends StatefulWidget {
  final String imagePath;
  final String title;
  final String author;
  final String publishDate;
  final String category;
  final double price;
  final double? oldPrice;
  final bool isFavorite;
  final bool isDiscounted;

  const BookCardCarousel({
    super.key,
    required this.imagePath,
    required this.title,
    required this.author,
    required this.publishDate,
    required this.category,
    required this.price,
    this.oldPrice,
    this.isFavorite = false,
    this.isDiscounted = false,
  });

  @override
  State<BookCardCarousel> createState() => _BookCardCarouselState();
}

class _BookCardCarouselState extends State<BookCardCarousel> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite; // Initial state
  }

  void _toggleFavorite() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    if (!userProvider.isLoggedIn) {
      // Si non connecté, redirection vers login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
      return;
    }

    // Sinon, toggle normalement
    setState(() {
      _isFavorite = !_isFavorite;
    });

    // 🔁 Tu peux ici aussi ajouter la logique pour sauvegarder les favoris localement
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(widget.imagePath,
                        height: 100, fit: BoxFit.cover),
                  ),
                ],
              ),
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: _toggleFavorite,
                  child: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorite ? Colors.red : Colors.grey.shade600,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text("${widget.author} | ${widget.publishDate}",
              style: const TextStyle(fontSize: 12)),
          Text(widget.category, style: const TextStyle(fontSize: 12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.oldPrice != null)
                Text(
                  '\$${widget.oldPrice!.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              Text(
                '\$${widget.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Color(0xFF00637C),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00CCFF),
              minimumSize: const Size(double.infinity, 32),
            ),
            child: const Text(
              "Add to Cart",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:dofia_the_book/widgets/welcome_message.dart';
import 'package:flutter/material.dart';

class GuestPagesFavCart extends StatefulWidget {
  final String guest_title_page;
  final String key_word_page;

  @override
  State<StatefulWidget> createState() => _GuestPagesFavCartState();
  const GuestPagesFavCart(
      {super.key, required this.guest_title_page, required this.key_word_page});
}

class _GuestPagesFavCartState extends State<GuestPagesFavCart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WelcomeMessage(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Text(
            widget.guest_title_page,
            textDirection: TextDirection.ltr,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: SizedBox(
              height: 530,
              child: Center(
                child: RichText(
                  softWrap: true,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    children: [
                      const TextSpan(
                        text: "Your ",
                      ),
                      TextSpan(
                          text: widget.key_word_page,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const TextSpan(text: " is empty\n\n"),
                      const TextSpan(text: "You need to "),
                      const TextSpan(
                        text: "Log in",
                        style: TextStyle(
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const TextSpan(
                        text: " first\n to add & save your ",
                      ),
                      TextSpan(
                          text: widget.key_word_page,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const TextSpan(text: " here.")
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

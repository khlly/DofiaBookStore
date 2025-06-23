import 'package:dofia_the_book/widgets/welcome_message.dart';
import 'package:dofia_the_book/screens/auth/login_screen.dart';
import 'package:flutter/gestures.dart';
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
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const WelcomeMessage(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              widget.guest_title_page,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: RichText(
              softWrap: true,
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                children: [
                  const TextSpan(text: "Your "),
                  TextSpan(
                      text: widget.key_word_page,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(text: " is empty\n\n"),
                  const TextSpan(text: "You need to "),
                  TextSpan(
                    text: "Log in",
                    style: const TextStyle(
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                  ),
                  const TextSpan(text: " first\n to add & save your "),
                  TextSpan(
                      text: widget.key_word_page,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(text: " here."),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

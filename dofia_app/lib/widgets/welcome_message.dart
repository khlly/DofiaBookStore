import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../screens/auth/login_screen.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFAFEFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: RichText(
            text: TextSpan(
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
          children: [
            const TextSpan(text: 'Hello Guest, '),
            TextSpan(
              text: 'Log in',
              style: const TextStyle(
                color: Colors.blue, // Highlight color
                fontWeight: FontWeight.bold,
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
            const TextSpan(text: ' first to make a purchase'),
          ],
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
            text: const TextSpan(
          style: TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(text: 'Hello '),
            TextSpan(
              text: 'NavinRem',
              style: TextStyle(
                color: Colors.blue, // Highlight color
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: ', Welcome back to Dofia!'),
          ],
        )),
        // child: const Text(
        //   'Hello Guest, Log in first to make a purchase',
        //   style: TextStyle(
        //     fontSize: 14,
        //     color: Colors.black87,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
      ),
    );
  }
}

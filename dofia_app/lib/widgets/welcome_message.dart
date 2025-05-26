import 'package:flutter/material.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFB8E6E6),
      child: const Text(
        'Hello NavinRem, Welcome back to Dofia!',
        style: TextStyle(
          fontSize: 14,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
// lib/widgets/auth/auth_header.dart
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final bool showBack;

  const AuthHeader({
    super.key,
    required this.title,
    this.showBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showBack)
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            )
          else
            const SizedBox(width: 48),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Icon(CupertinoIcons.bell, color: Colors.black, size: 28),
        ],
      ),
    );
  }
}

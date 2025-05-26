import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // Handle menu tap
            },
          ),
          const Text(
            'DofiaTheBook',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.teal),
            onPressed: () {
              // Handle notification tap
            },
          ),
        ],
      ),
    );
  }
}
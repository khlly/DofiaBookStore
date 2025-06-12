import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      color: const Color(0xFFE0F7FF), // Light grey background
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
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
          IconButton(
            icon:
                const Icon(Icons.notifications, color: Colors.black, size: 25),
            onPressed: () {
              // Handle notification tap
            },
          ),
        ],
      ),
    );
  }
}

import 'package:dofia_the_book/widgets/bottom_navbar.dart';
import 'package:dofia_the_book/widgets/header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FF),
      body: const Column(
        children: [
          SizedBox(height: 40), // Simule la status bar
          CustomHeader(),
          Expanded(
            child: Center(
              child: Text(
                'Page 1',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onItemSelected: (index) {
          setState(() => currentIndex = index);
        },
      ),
    );
  }
}

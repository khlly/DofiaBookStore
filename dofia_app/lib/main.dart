import 'package:dofia_the_book/widgets/carousel_banner.dart';
import 'package:dofia_the_book/widgets/custom_app_bar.dart';
// import 'package:dofia_the_book/widgets/custom_bottom_nav_bar.dart';
import 'package:dofia_the_book/widgets/bottom_nav_bar.dart';
import 'package:dofia_the_book/widgets/welcome_message.dart';
import 'package:dofia_the_book/widgets/search_bar.dart' as custom;
import 'package:flutter/material.dart';

void main() {
  runApp(const DofiaTheBookApp());
}

class DofiaTheBookApp extends StatelessWidget {
  const DofiaTheBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DofiaTheBook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFE0F7FF),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(),
            const WelcomeMessage(),
            const custom.SearchBar(),
            const BookCarousel(
              books: [
                'assets/images/book1.jpg',
                'assets/images/book2.jpg',
                'assets/images/book3.jpg',
              ],
            ),
            Expanded(
              child: Container(
                color: const Color(0xFFE0F7FF),
                // Main content area
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottom_nav_bar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          // Handle item tap
          setState(() {
            _selectedIndex = index; // Update the selected index
          });
        },
      ),
    );
  }
}

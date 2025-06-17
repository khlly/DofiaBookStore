import 'package:dofia_the_book/widgets/book_carousel.dart';
import 'package:dofia_the_book/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:dofia_the_book/widgets/welcome_message.dart';
import 'package:dofia_the_book/widgets/search_bar.dart' as custom;
import 'package:dofia_the_book/widgets/bottom_nav_bar.dart';

class HomeScreenGuest extends StatefulWidget {
  const HomeScreenGuest({super.key});

  @override
  State<HomeScreenGuest> createState() => _HomeScreenGuestState();
}

class _HomeScreenGuestState extends State<HomeScreenGuest> {
  int _selectedIndex = 0; // Default selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'DofiaTheBook'),
      body: SafeArea(
        child: Column(
          children: [
            const WelcomeMessage(),
            const custom.SearchBar(),
            Expanded(
              child: Container(
                color: const Color(0xFFE0F7FF),
                // Main content area
                child: const BookCarousel(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

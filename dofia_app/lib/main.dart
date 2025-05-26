import 'package:dofia_the_book/widgets/custom_app_bar.dart';
import 'package:dofia_the_book/widgets/custom_bottom_nav_bar.dart';
import 'package:dofia_the_book/widgets/welcome_message.dart';
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
        scaffoldBackgroundColor: const Color(0xFFE8F4F8),
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
            const SearchBar(),
            Expanded(
              child: Container(
                color: const Color(0xFFE8F4F8),
                // Main content area
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
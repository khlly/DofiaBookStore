import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navIcon(Icons.home, 0),
          _navIcon(Icons.favorite, 1),
          _navIcon(Icons.shopping_cart_outlined, 2),
          _navIcon(Icons.person, 3),
        ],
      ),
    );
  }

  Widget _navIcon(IconData icon, int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: CircleAvatar(
        backgroundColor:
            isSelected ? Colors.lightBlueAccent : Colors.transparent,
        radius: 24,
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.black54,
          size: 24,
        ),
      ),
    );
  }
}

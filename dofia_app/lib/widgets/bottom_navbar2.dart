import 'package:flutter/material.dart';

class bottom_nav_bar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  static const List<IconData> _icons = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  const bottom_nav_bar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1.0,
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_icons.length, (index) {
            bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () => onItemTapped(index),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isSelected ? Colors.lightBlueAccent : Colors.transparent,
                ),
                child: Icon(
                  _icons[index],
                  color: isSelected ? Colors.white : Colors.black,
                  size: 28,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
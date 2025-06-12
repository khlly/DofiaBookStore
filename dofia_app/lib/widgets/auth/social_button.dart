import 'package:flutter/material.dart';

class SocialSignUpButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const SocialSignUpButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const ShapeDecoration(
        color: Colors.cyan,
        shape: CircleBorder(),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        onPressed: onPressed,
      ),
    );
  }
}

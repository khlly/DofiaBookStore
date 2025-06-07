import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    );

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: inputDecoration.copyWith(
                  hintText: 'First Name',
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                decoration: inputDecoration.copyWith(
                  hintText: 'Last Name',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextField(
          decoration: inputDecoration.copyWith(hintText: 'Username'),
        ),
        const SizedBox(height: 12),
        TextField(
          decoration: inputDecoration.copyWith(hintText: 'Phone Number of Email'),
        ),
        const SizedBox(height: 12),
        TextField(
          obscureText: true,
          decoration: inputDecoration.copyWith(hintText: 'Create new password'),
        ),
        const SizedBox(height: 12),
        TextField(
          obscureText: true,
          decoration: inputDecoration.copyWith(hintText: 'Confirm new password'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyanAccent[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: () {
            // TODO: Ajouter logique d'inscription
          },
          child: const Text(
            'Create Account',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

// lib/screens/auth/signup_screen.dart
import 'package:flutter/material.dart';
import '../../widgets/auth/auth_header.dart';
import '../../widgets/auth/signup_form.dart';
import '../../widgets/auth/social_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AuthHeader(title: 'DofiaTheBook', showBack: true),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const SignUpForm(),
                    const SizedBox(height: 20),
                    const Text('OR', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    const Text('Sign Up with',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16)),
                    const SizedBox(height: 10),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
     //SocialSignUpButton(icon: Icons.whatsapp, onPressed: () {}),
     SocialSignUpButton(icon: Icons.facebook, onPressed: () {}),
     SocialSignUpButton(icon: Icons.camera_alt, onPressed: () {}), // Instagram
     SocialSignUpButton(icon: Icons.send, onPressed: () {}), // Telegram
  ],
),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

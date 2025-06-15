// lib/screens/auth/signup_screen.dart
import 'package:flutter/material.dart';
import '../../widgets/auth/auth_header.dart';
import '../../widgets/auth/signup_form.dart';
import '../../widgets/auth/social_button.dart';
import '../home_screen.dart'; // Make sure to import your HomePage

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _navigateToHomePage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

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
                    // --- Logo Section ---
                    Image.asset(
                      'assets/share/logoDofia.png',
                      height: 150,
                    ),
                    // --- Title Section ---

                    const Text(
                      'Create a new account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // color of title
                      ),
                    ),
                    // --- Form Fields ---
                    const SizedBox(height: 20),
                    // Pass the callback to SignUpForm
                    SignUpForm(
                      onSignUpSuccess: () => _navigateToHomePage(context),
                    ),
                    const SizedBox(height: 20),
                    const Text('OR',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    const Text('Sign Up with',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialSignUpButton(
                            icon: Icons.facebook, onPressed: () {}),
                        SocialSignUpButton(
                            icon: Icons.camera_alt,
                            onPressed: () {}), // Instagram
                        SocialSignUpButton(
                            icon: Icons.send, onPressed: () {}), // Telegram
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
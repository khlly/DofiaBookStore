// lib/screens/auth/login_screen.dart
import 'package:flutter/material.dart';
import 'package:dofia_the_book/widgets/auth/auth_form.dart';
import 'package:dofia_the_book/widgets/auth/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneOrEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // is valid email function
  bool isValidEmail(String email) {
    // Regex for validation.
    // can use package like 'email_validator' if in need of robustess.
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // check phone format
  // basic regex
  bool isValidPhoneNumber(String phoneNumber) {
    // delete non numerical characters
    String cleanedNumber = phoneNumber.replaceAll(RegExp(r'\S'), '');
    // phone between 7 and 15 number
    return cleanedNumber.length >= 7 && cleanedNumber.length <= 15;
    // can use package like 'phone_form_field' for more robustess
  }

  @override
  void dispose() {
    _phoneOrEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FF),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text("Welcome Back",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const AuthForm(isLogin: true),
            SocialSignUpButton(
              icon: Icons.login,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

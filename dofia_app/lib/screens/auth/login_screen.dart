import 'package:flutter/material.dart';
import 'package:dofia_the_book/widgets/auth/auth_form.dart';
import 'package:dofia_the_book/widgets/auth/social_button.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FF),
      body: SafeArea(
        child: Column(
          children: const [
            SizedBox(height: 40),
            Text("Welcome Back", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            AuthForm(isLogin: true),
            SocialButtons(),
          ],
        ),
      ),
    );
  }
}


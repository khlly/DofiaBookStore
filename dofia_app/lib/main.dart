import 'package:dofia_the_book/screens/auth/login_screen.dart';
import 'package:dofia_the_book/screens/auth/signup_screen.dart';
//import 'package:dofia_the_book/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dofia BookStore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Ajoute ici tes thèmes de couleurs et de texte comme discuté précédemment
      ),
      home: const LoginScreen(), // C'est ici que tu utilises ton HomeScreen
    );
  }
}
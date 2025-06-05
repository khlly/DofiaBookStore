import 'package:dofia_the_book/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dofia BookStore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Ajoute ici tes thèmes de couleurs et de texte comme discuté précédemment
      ),
      home: const HomeScreen(), // C'est ici que tu utilises ton HomeScreen
    );
  }
}
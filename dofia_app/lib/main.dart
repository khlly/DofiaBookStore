import 'package:dofia_the_book/data/book_provider.dart';
import 'package:dofia_the_book/data/cart_provider.dart';
import 'package:dofia_the_book/data/user_provider.dart';
import 'package:dofia_the_book/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => BookProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()), 
        ],
        child: const DofiaTheBookApp(),
      ),
    );
  });
}


class DofiaTheBookApp extends StatelessWidget {
  const DofiaTheBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dofia BookStore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFE0F7FF),
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

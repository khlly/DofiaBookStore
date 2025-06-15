import 'package:dofia_the_book/screens/home_screen_guest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(DofiaTheBookApp());
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
      home: const HomeScreenGuest(),
      debugShowCheckedModeBanner: false,
    );
  }
}

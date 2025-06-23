import 'package:dofia_the_book/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:dofia_the_book/data/user_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(
      ChangeNotifierProvider(
          create: (_) => UserProvider(), child: const DofiaTheBookApp()),
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
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

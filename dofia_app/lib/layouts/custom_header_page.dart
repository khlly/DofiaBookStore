import 'package:flutter/material.dart';

class CustomHeaderPage extends StatelessWidget {
  const CustomHeaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("DofiaTheBook"), // This will start *below* status bar
            Expanded(child: Center(child: Text("Content"))),
          ],
        ),
      ),
    );
  }
}

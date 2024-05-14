import 'package:ai_assistant_app/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AiApp());
}

class AiApp extends StatelessWidget {
  const AiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:minimal_portfolio/ui/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'ChakraPetch'),
      home: const HomePage(),
    );
  }
}

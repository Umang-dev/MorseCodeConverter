import 'package:flutter/material.dart';
import 'package:morse_code_converter/feature/home/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Morse to English Converter',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

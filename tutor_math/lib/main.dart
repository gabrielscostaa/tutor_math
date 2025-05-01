import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutor de Matemática',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

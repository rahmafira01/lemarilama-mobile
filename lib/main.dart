import 'package:flutter/material.dart';
import 'package:lemari_lama/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lemari Lama',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF7F6269),
          primary: Color(0xFF7F6269),
          secondary: Color(0xFF7F6269),
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

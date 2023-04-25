import 'package:easecook/views/main_navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EaseCook',
      theme: ThemeData(
        fontFamily: 'Urbanist',
        primarySwatch: Colors.blue,
      ),
      home: const MainNavBar(),
    );
  }
}

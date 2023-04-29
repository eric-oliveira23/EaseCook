import 'package:easecook/theme/colors.dart';
import 'package:easecook/views/main_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EaseCook',
      theme: ThemeData(
        fontFamily: 'Urbanist',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.redPrimary,
        ),
      ),
      home: const MainNavBar(),
    );
  }
}

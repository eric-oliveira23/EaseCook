import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CustomSnackbar extends StatelessWidget {
  const CustomSnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetSnackBar(
      title: 'Sucess',
      message: 'a',
      margin: EdgeInsets.all(15),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

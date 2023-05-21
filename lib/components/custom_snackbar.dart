import 'package:flutter/material.dart';

showCustomSnackbar(String message, BuildContext context) {
  var snackbar = SnackBar(
    content: Text(message),
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

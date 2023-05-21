import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../components/custom_snackbar.dart';

class HomeController extends GetxController {
  toggleBookmark(
    bool isBookmarkActive,
    animationController,
    BuildContext context,
  ) {
    isBookmarkActive = !isBookmarkActive;

    if (isBookmarkActive) {
      showCustomSnackbar('Item saved.', context);
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }
}

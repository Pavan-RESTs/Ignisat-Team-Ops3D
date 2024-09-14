import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snack {
  static void display(String message) {
    Get.snackbar(
      'Success',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black87,
      colorText: Colors.white,
      duration: Duration(seconds: 3),
    );
  }
}

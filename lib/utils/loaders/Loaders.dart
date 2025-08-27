import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DLoaders {
  // Error status - for displaying error messages with red color
  static void error(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.8),
      colorText: Colors.white,
      icon: const Icon(Icons.error_outline, color: Colors.white),
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
    );
  }

  // Success status - for displaying success messages with green color
  static void success(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
    );
  }

  // Warning status - for displaying warning messages with amber/yellow color
  static void warning(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.amber.withOpacity(0.8),
      colorText: Colors.black87,
      icon: const Icon(Icons.warning_amber_rounded, color: Colors.black87),
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
    );
  }

  // Info status - for displaying informational messages with blue color
  static void info(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue.withOpacity(0.8),
      colorText: Colors.white,
      icon: const Icon(Icons.info_outline, color: Colors.white),
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
    );
  }

  // Loading dialog - for showing a loading spinner
  static void showLoading({String message = 'Loading...'}) {
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
  }
}

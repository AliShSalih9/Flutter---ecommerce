import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DDeviceUtility {
  // Hide the keyboard
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  // Set status bar color
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  // Check if the device is in landscape orientation
  static bool isLandscapeOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  // Check if the device is in portrait orientation
  static bool isPortraitOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  // Enable or disable full screen mode
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
      enable ? SystemUiMode.immersive : SystemUiMode.edgeToEdge,
    );
  }

  // Get screen height using Get.context
  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  // Get screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Get device pixel ratio
  static double getPixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  // Get status bar height
  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  // Get bottom navigation bar height (constant)
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  // Get app bar height (constant)
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  // Get keyboard height
  static double getKeyboardHeight() {
    return MediaQuery.of(Get.context!).viewInsets.bottom;
  }

  // Check if the keyboard is currently visible
  static bool isKeyboardVisible() {
    return MediaQuery.of(Get.context!).viewInsets.bottom > 0;
  }

  // Check if running on a physical device (not web or desktop)
  static bool isPhysicalDevice() {
    return !kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS);
  }

  // Vibrate the device with a delay
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () {
      HapticFeedback.vibrate();
    });
  }

  // Set preferred device orientations
  static Future<void> setPreferredOrientations(
    List<DeviceOrientation> orientations,
  ) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  // Hide status bar
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  // Show status bar
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  // Check internet connection
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup(
        'example.com',
      ).timeout(const Duration(seconds: 5));
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException {
      return false;
    } on TimeoutException {
      return false;
    }
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
    {
      throw 'Could not launch $url';
    }
  }

  
}

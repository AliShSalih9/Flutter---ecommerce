import 'package:ecommerce/common/widgets/full_screen_loader.dart';
import 'package:ecommerce/controllers/Network/networkController.dart';
import 'package:ecommerce/data/repositories/auth/authentication_repository.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/screens/navigation/BottomNav.dart';
import 'package:ecommerce/utils/loaders/Loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signincontroller extends GetxController {
  static Signincontroller get instance => Get.find();
  final UserController userController = Get.put(UserController());

  final email = TextEditingController();
  final password = TextEditingController();
  final rememberMe = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Load saved credentials if available
    final savedEmail = AuthenticationRepository.instance.deviceStorage.read(
      'email',
    );
    final savedPassword = AuthenticationRepository.instance.deviceStorage.read(
      'password',
    );
    if (savedEmail != null) {
      email.text = savedEmail;
    }
    if (savedPassword != null) {
      password.text = savedPassword;
    }
  }

  Future<void> signIn() async {
    try {
      await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
        rememberMe: rememberMe.value,
      );
    } catch (e) {
      // Handle sign-in errors, e.g., show a snackbar with the error message
      Get.snackbar(
        'Sign In Failed',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> toggleRememberMe(bool value) async {
    rememberMe.value = value;
    if (value) {
      // Save email and password to device storage
      AuthenticationRepository.instance.deviceStorage.write(
        'email',
        email.text.trim(),
      );
      AuthenticationRepository.instance.deviceStorage.write(
        'password',
        password.text.trim(),
      );
    } else {
      // Clear saved credentials
    }
  }

  // Google Sign in
  Future<void> googleSignIn() async {
    try {
      DLoaders.showLoading(message: 'Signing in with Google...');
      final isConnected = await NetworkManger.instance.isConnected();
      if (!isConnected) {
        DFullScreenLoader.stopLoading();
        return;
      }
      // Google Authentication
      final user = await AuthenticationRepository.instance.signInWithGoogle();

      userController.saveUserRecord(user);
      DFullScreenLoader.stopLoading();

      if (user != null) {
        Get.offAll(DBottomNav());
      }
    } catch (e) {
      DFullScreenLoader.stopLoading();
      Get.snackbar(
        'Google Sign In Failed',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

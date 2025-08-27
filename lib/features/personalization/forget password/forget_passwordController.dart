import 'package:ecommerce/screens/success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordcontroller extends GetxController {
  final email = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }

  void resetPassword() {
    _auth
        .sendPasswordResetEmail(email: email.text)
        .then((value) {
          Get.to(
            SuccessScreen(
              title: "Reset Password",
              subtitle: "A password reset link has been sent to your email.",
            ),
          ); // Navigate to success screen
        })
        .catchError((error) {
          Get.snackbar(
            "Error",
            error.toString(),
            snackPosition: SnackPosition.BOTTOM,
          );
        });
  }
}

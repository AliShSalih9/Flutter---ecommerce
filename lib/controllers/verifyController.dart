import 'dart:async';

import 'package:ecommerce/data/repositories/auth/authentication_repository.dart';
import 'package:ecommerce/screens/success_screen.dart';
import 'package:ecommerce/utils/loaders/Loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Verifycontroller extends GetxController {
  @override
  void onInit() {
    sendEmailVerification();
    SetTimeforAutoRedir();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
    } catch (e) {
      // Handle any errors that occur during email verification
      DLoaders.error("oh snap!", e.toString());
    }
  }

  void SetTimeforAutoRedir() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user != null && user.emailVerified) {
        timer.cancel();
        Get.offAll(
          () => SuccessScreen(
            title: "Email Verified",
            subtitle: "Your email has been successfully verified.",
          ),
        );
      }
    });
  }
}

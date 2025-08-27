import 'package:ecommerce/common/widgets/full_screen_loader.dart';
import 'package:ecommerce/controllers/Network/networkController.dart';
import 'package:ecommerce/data/repositories/auth/authentication_repository.dart';
import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/features/personalization/models/User_model.dart';
import 'package:ecommerce/screens/verify/verify_screen.dart';
import 'package:ecommerce/utils/constant/image_strings.dart';
import 'package:ecommerce/utils/loaders/Loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signupcontroller extends GetxController {
  static Signupcontroller get to => Get.find();

  //Varibale
  var aggrement = false.obs;
  final email = TextEditingController();
  final first_name = TextEditingController();
  final last_name = TextEditingController();
  final username = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // -- SignUp
  void signUp() async {
    try {
      DFullScreenLoader.openLoadingDialoge(
        "We are processing your information...",
        DImages.decorAnimation,
      );

      final isConnected = await NetworkManger.instance.isConnected();
      if (!isConnected) {
        DFullScreenLoader.stopLoading();
        return;
      }

      if (!signupFormKey.currentState!.validate()) {
        DFullScreenLoader.stopLoading();
        return;
      }

      if (!aggrement.value) {
        DFullScreenLoader.stopLoading();
        DLoaders.warning("Privacy Policy", "Please accept the privacy policy");
        return;
      }

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      final newUser = UserModel(
        id: userCredential!.user!.uid,
        email: email.text.trim(),
        firstName: first_name.text.trim(),
        lastName: last_name.text.trim(),
        username: username.text.trim(),
        phone: phone.text.trim(),
        imagePath: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser); // await here!

      DFullScreenLoader.stopLoading(); // stop loader before navigation

      DLoaders.success(
        "Congratulations",
        "Your account has been created successfully.",
      );

      Get.to(() => verifyScreen(email: email.text.trim())); // navigate now
    } catch (e) {
      DFullScreenLoader.stopLoading();
      DLoaders.error("Signup Error", e.toString());
    }
  }

  // -- verification Email
}

import 'package:ecommerce/screens/register/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  final GetStorage _storage = GetStorage();

  Future<void> _completeOnboarding() async {
    // Mark onboarding as completed
    await _storage.write('IsFirstTime', false);
    Get.offAll(() => LoginScreen());
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      _completeOnboarding();
    }
  }

  void skip() {
    _completeOnboarding(); // ✅ Correct navigation
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

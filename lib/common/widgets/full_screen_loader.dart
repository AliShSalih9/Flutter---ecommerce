import 'package:ecommerce/common/widgets/animation_loader.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DFullScreenLoader {
  static void openLoadingDialoge(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,

      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          child: Container(
            color: DHelperFunction.isDarkMode(context)
                ? DColors.dark
                : Colors.white.withOpacity(0.8),
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 250),

                  DAnimationLoader(text: text, animation: animation),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}

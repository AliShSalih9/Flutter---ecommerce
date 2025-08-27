import 'package:ecommerce/controllers/login/showPassword.dart';
import 'package:ecommerce/screens/register/widget/DDivder.dart';
import 'package:ecommerce/screens/register/widget/DSignUp.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  final controller = Get.put(ShowPasswordController());
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DSizes.defaultSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Join Us Now!',
                style: TextStyle(
                  fontSize: DSizes.fontSizeLg,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: DSizes.spaceBtwItems),
              DSignUpForm(controller: controller),
              SizedBox(height: DSizes.spaceBtwItems),
              DFormDivder(),
              SizedBox(height: DSizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: DSizes.spaceBtwItems),
                  InkWell(
                    onTap: () {
                      // Handle Google login
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.5),

                        color: Colors.grey.withValues(alpha: 0.2),
                      ),
                      child: IconButton(
                        icon: Image.asset(
                          DImages.googleLogo,
                          width: 24,
                          height: 24,
                        ),

                        onPressed: () {
                          // Handle Google login
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: DSizes.spaceBtwItems),
                  InkWell(
                    onTap: () {
                      // Handle Google login
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withValues(alpha: 0.2),
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                      child: IconButton(
                        icon: Image.asset(
                          DImages.facebookLogo,
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {
                          // Handle Facebook login
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // Add your sign-up form and logic here
    );
  }
}

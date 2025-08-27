import 'package:ecommerce/controllers/login/showPassword.dart';
import 'package:ecommerce/features/personalization/controllers/signIncontroller.dart';
import 'package:ecommerce/screens/forget_password.dart';
import 'package:ecommerce/screens/register/signUp.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.put(ShowPasswordController());
  final Signincontroller signinController = Get.put(Signincontroller());

  /// A screen for user login.
  LoginScreen({super.key});

  /// Builds the login screen UI.
  final bool _showPassword = false; // Example variable to toggle dark mode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DSizes.defaultSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/logos/icon-app.png',
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              SizedBox(height: DSizes.spaceBtwSections),
              Text(
                '👋 Welcome Back!',
                style: TextStyle(
                  fontSize: DSizes.fontSizeXl,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: DSizes.spaceBtwItems),
              Text(
                'Log in to resume your journey with us. Your data is safe and secure!',
                style: TextStyle(
                  fontSize: DSizes.fontSizeSm,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: DSizes.spaceBtwSections),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: Colors.blue.shade800,
                      controller: Signincontroller.instance.email,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            DSizes.inputFieldRadius,
                          ),
                        ),
                        prefixIcon: Icon(Icons.email, size: DSizes.iconMd),
                      ),
                    ),
                    SizedBox(height: DSizes.spaceBtwInputFields),
                    Obx(
                      () => TextFormField(
                        cursorColor: Colors.blue.shade800,

                        obscureText: controller.isPasswordVisible.value
                            ? false
                            : true,
                        autocorrect: false,
                        controller: Signincontroller.instance.password,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.togglePasswordVisibility();
                            },
                            icon: controller.isPasswordVisible.value
                                ? Icon(Iconsax.eye)
                                : Icon(Iconsax.eye_slash),
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              DSizes.inputFieldRadius,
                            ),
                          ),
                          prefixIcon: Icon(Icons.lock, size: DSizes.iconMd),
                        ),
                      ),
                    ),
                    SizedBox(height: DSizes.spaceBtwInputFields),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                value:
                                    Signincontroller.instance.rememberMe.value,
                                onChanged: (value) {
                                  Signincontroller.instance.toggleRememberMe(
                                    value!,
                                  );
                                },
                              ),
                            ),
                            Text(
                              'Remember Me',
                              style: TextStyle(fontSize: DSizes.fontSizeSm),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle forgot password action
                            Get.to(() => ForgetPassword());
                          },
                          child: Text(
                            'Forget Password',
                            style: TextStyle(
                              fontSize: DSizes.fontSizeSm,
                              color: Colors.blue.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: DSizes.spaceBtwItems),
                    ElevatedButton(
                      onPressed: () => Signincontroller.instance.signIn(),

                      // Handle login action
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, DSizes.buttonHeight),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            DSizes.buttonRadius,
                          ),
                        ),
                        elevation: DSizes.buttonElevation,
                      ),

                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: DSizes.fontSizeMd,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: DSizes.spaceBtwItems),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(double.infinity, DSizes.buttonHeight),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            DSizes.buttonRadius,
                          ),
                        ),
                        side: BorderSide(
                          color: Colors.blue.shade800,
                          width: 1.5,
                        ),
                      ),
                      onPressed: () {
                        Get.to(SignUpScreen());
                      },
                      child: Text(
                        'Create New Account',
                        style: TextStyle(
                          fontSize: DSizes.fontSizeMd,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: DSizes.spaceBtwSections),

              Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: 35,
                      color: Colors.grey,
                      height: DSizes.dividerHeight,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: DSizes.sm),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(fontSize: DSizes.fontSizeSm),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      endIndent: 35,
                      color: Colors.grey,
                      height: DSizes.dividerHeight,
                    ),
                  ),
                ],
              ),
              SizedBox(height: DSizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // --- Google Button ---
                  InkWell(
                    onTap: signinController.googleSignIn, // ✅ only here
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.5),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: Center(
                        child: Image.asset(
                          DImages.googleLogo,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: DSizes.spaceBtwItems),

                  // --- Facebook Button ---
                  InkWell(
                    onTap: () {
                      // signinController.facebookSignIn(); // ✅ create this method
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.5),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: Center(
                        child: Image.asset(
                          DImages.facebookLogo,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ecommerce/controllers/login/showPassword.dart';
import 'package:ecommerce/features/personalization/controllers/signUp/signUpController.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/validator/validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DSignUpForm extends StatelessWidget {
  DSignUpForm({super.key, required this.controller});

  final ShowPasswordController controller;
  final Signupcontroller signupController = Get.put(Signupcontroller());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: signupController.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: signupController.first_name,
                  validator: (value) =>
                      DValidator.validateName('First Name', value),
                  cursorColor: Colors.blue,

                  decoration: InputDecoration(
                    labelText: 'First Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: DSizes.spaceBtwItems),
              Expanded(
                child: TextFormField(
                  controller: signupController.last_name,
                  validator: (value) =>
                      DValidator.validateName('Last Name', value),
                  cursorColor: Colors.blue,

                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: DSizes.spaceBtwItems),
          TextFormField(
            controller: signupController.username,
            cursorColor: Colors.blue,
            validator: (value) => DValidator.validateName('Username', value),

            decoration: InputDecoration(
              labelText: 'Username',
              prefixIcon: Icon(Icons.person_outline),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: DSizes.spaceBtwItems),
          TextFormField(
            controller: signupController.email,
            cursorColor: Colors.blue,
            validator: (value) => DValidator.validateEmail(value),

            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: DSizes.spaceBtwItems),
          TextFormField(
            cursorColor: Colors.blue,
            validator: (value) => DValidator.validateIraqiPhoneNumber(value),
            controller: signupController.phone,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: DSizes.spaceBtwItems),
          Obx(
            () => TextFormField(
              controller: signupController.password,
              validator: (value) => DValidator.validatePassword(value),
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    !controller.isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    controller.togglePasswordVisibility();
                  },
                ),
              ),
              obscureText: !controller.isPasswordVisible.value,
            ),
          ),
          SizedBox(height: DSizes.spaceBtwItems),
          Row(
            children: [
              Obx(
                () => Checkbox(
                  checkColor: Colors.white,
                  value: signupController
                      .aggrement
                      .value, // Replace with your logic for terms acceptance
                  onChanged: (value) {
                    // Handle checkbox state change
                    signupController.aggrement.value = value!;
                  },
                ),
              ),
              Text.rich(
                TextSpan(
                  text: 'I accept the ',
                  style: TextStyle(fontSize: DSizes.fontSizeXs),
                  children: [
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: DSizes.fontSizeSm,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle terms and conditions tap
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: DSizes.spaceBtwItems),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, DSizes.buttonHeight),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(DSizes.buttonRadius),
              ),
            ),
            onPressed: signupController.signUp,
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}

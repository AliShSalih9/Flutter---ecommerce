import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/features/personalization/forget%20password/forget_passwordController.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final controller = Get.put(ForgetPasswordcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(DSizes.defaultSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: DSizes.fontSizeXl,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: DSizes.spaceBtwItems),
            Text(
              'Please enter your email address to receive a password reset link.',
              style: TextStyle(fontSize: DSizes.fontSizeSm, color: Colors.grey),
            ),
            SizedBox(height: DSizes.spaceBtwItems),
            TextFormField(
              controller: controller.email,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.send),
              ),
              style: TextStyle(fontSize: DSizes.fontSizeSm, color: Colors.grey),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: DSizes.spaceBtwSections),
            ElevatedButton(
              onPressed: controller.resetPassword,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, DSizes.buttonHeight),
              ),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

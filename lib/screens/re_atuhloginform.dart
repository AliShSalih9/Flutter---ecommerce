import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReAtuhloginform extends StatelessWidget {
  ReAtuhloginform({super.key});
  final controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(title: Text("ReAuth"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(DSizes.defaultSpacing),
          child: Form(
            key: controller.formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.email,
                  validator: (value) => DValidator.validateEmail(value),
                  decoration: InputDecoration(labelText: "Email"),

                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: DSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.password,
                  validator: (value) => DValidator.validatePassword(value),

                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                SizedBox(height: DSizes.spaceBtwItems),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(DSizes.buttonWidth, DSizes.buttonHeight),
                  ),
                  onPressed: controller.reAuthenticateEmailAndPasswordUser,
                  child: Text("Delete Account"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

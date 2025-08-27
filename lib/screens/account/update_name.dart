import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/features/personalization/controllers/update_nameController.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UpdateName extends StatelessWidget {
  UpdateName({super.key});
  final controller = Get.put(UpdateNameController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(showBackArrow: true, title: Text('Update Name')),
      body: Padding(
        padding: EdgeInsetsGeometry.all(DSizes.defaultSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Here you can update your full name. "
              "Make sure to write your real and complete name, "
              "as this information may appear in your profile and be used in different parts of the application. "
              "Having the correct name helps in personalizing your account, "
              "improves identification, and keeps your data consistent across the system.",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: DSizes.spaceBtwItems),
            Form(
              key: controller.formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstname,
                    validator: (value) =>
                        DValidator.validateName('first name', value),
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  SizedBox(height: DSizes.spaceBtwItems),
                  TextFormField(
                    controller: controller.lastname,
                    validator: (value) =>
                        DValidator.validateName('last name', value),
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: DSizes.spaceBtwSections),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, DSizes.buttonHeight),
              ),

              onPressed: controller.UpdateUsername,
              child: Text("Save"),
            ),

            // Obx(() => ElevatedButton(
            // onPressed: () async {
            // await controller.UpdateUsername();
            //}
            // ,child: Text(controller.isLoading.value ? "Loading..." : "Save")
          ],
        ),
      ),
    );
  }
}

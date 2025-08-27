import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/controllers/verifyController.dart';
import 'package:ecommerce/screens/register/login.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/image_strings.dart';
import 'package:ecommerce/utils/constant/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class verifyScreen extends StatelessWidget {
  verifyScreen({super.key, required this.email});
  final Controller = Get.put(Verifycontroller());
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Get.offAll(() => LoginScreen());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                DImages.verificationImage,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              const SizedBox(height: DSizes.spaceBtwItems),
              Text(
                DTexts.verificationTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                email,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: DSizes.spaceBtwItems),
              Text(
                DTexts.verificationDesc,
                style: Theme.of(context).textTheme.labelMedium,

                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DSizes.spaceBtwItems),
              TextButton(
                onPressed: Controller.sendEmailVerification,
                child: Text("Resend"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

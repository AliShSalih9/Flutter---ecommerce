import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/data/repositories/auth/authentication_repository.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/image_strings.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.title, required this.subtitle});
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                DImages.successImage,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              const SizedBox(height: DSizes.spaceBtwItems),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DSizes.spaceBtwItems),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DSizes.spaceBtwItems),
              ElevatedButton(
                onPressed: () =>
                    AuthenticationRepository.instance.screenRedirect(),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: DSizes.defaultSpacing,
                    vertical: DSizes.defaultSpacing / 2,
                  ),
                ),
                child: Text("Home Page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

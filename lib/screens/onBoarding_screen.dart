import 'package:ecommerce/features/personalization/controllers/onBoarding/onBoardingController.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/image_strings.dart';
import 'package:ecommerce/utils/constant/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final onboardingController = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: DSizes.appBarHeight),
        child: Stack(
          children: [
            PageView(
              controller: onboardingController.pageController,
              onPageChanged: onboardingController.onPageChanged,
              children: [
                OnBoradingWidget(
                  image: DImages.onBoarding1,
                  title: DTexts.onBoardingTitle1,
                  description: DTexts.onBoardingDesc1,
                ),
                OnBoradingWidget(
                  image: DImages.onBoarding2,
                  title: DTexts.onBoardingTitle2,
                  description: DTexts.onBoardingDesc2,
                ),
                OnBoradingWidget(
                  image: DImages.onBoarding3,
                  title: DTexts.onBoardingTitle3,
                  description: DTexts.onBoardingDesc3,
                ),
              ],
            ),
            //Header with Logo and Skip Button
            Positioned(
              right: 0,
              child: TextButton(
                onPressed: () {
                  print("Button pressed!"); // Confirm button works
                  onboardingController.skip();
                },

                child: Text(
                  "Skip",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            //Fotter with Page Indicator and Next Button
            Positioned(
              left: DSizes.lg,
              bottom: DSizes.lg,
              child: SmoothPageIndicator(
                controller: onboardingController.pageController,
                count: 3,
                axisDirection: Axis.horizontal,
                effect: ExpandingDotsEffect(
                  dotHeight: DSizes.iconSm,
                  dotWidth: DSizes.iconSm,
                  activeDotColor: Theme.of(context).primaryColor,

                  dotColor: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
            ),

            Positioned(
              bottom: DSizes.md,
              right: DSizes.md,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  side: BorderSide.none,

                  shape: CircleBorder(),
                ),
                onPressed: () {
                  onboardingController.nextPage();
                },
                child: Icon(Icons.arrow_forward, size: DSizes.iconLg),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoradingWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const OnBoradingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, height: MediaQuery.of(context).size.height * 0.6),
        Text(
          textAlign: TextAlign.center,
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: DSizes.spaceBtwItems),
        Text(
          textAlign: TextAlign.center,
          description,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

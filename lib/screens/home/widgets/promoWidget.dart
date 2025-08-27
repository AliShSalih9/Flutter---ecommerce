import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/common/widgets/continar_circular.dart';
import 'package:ecommerce/controllers/bannar_controller.dart';
import 'package:ecommerce/screens/home/widgets/RoundedImage.dart';
import 'package:ecommerce/screens/loading/dShimmerEffect.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DPromoSlider extends StatelessWidget {
  DPromoSlider({super.key});

  final controller = Get.put(DBannarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpacing),
          child: Dshimmereffect(width: double.infinity, height: 190),
        );
      } else if (controller.banners.isEmpty) {
        return Container();
      } else {
        return Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpacing),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: true,
                  onPageChanged: (index, reason) =>
                      controller.changeIndex(index),
                ),

                items: controller.banners
                    .map(
                      (url) => DRoundedImage(
                        image: url.imageURL,
                        onpressed: () => Get.toNamed(url.targetSreen),
                        width: double.infinity,
                        height: DSizes.imageCarouselHeight,
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: DSizes.spaceBtwItems),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      DCirculeContinar(
                        width: 15,
                        height: 4,
                        background: controller.carsoulCurrentIndex.value == i
                            ? DColors.primaryColor
                            : Colors.grey,
                        margin: EdgeInsets.only(left: 10),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}

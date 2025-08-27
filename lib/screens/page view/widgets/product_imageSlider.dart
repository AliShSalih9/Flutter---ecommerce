import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/common/widgets/Circular_icon.dart';
import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/common/widgets/customer_clipper.dart';
import 'package:ecommerce/features/personalization/controllers/ImageController.dart';
import 'package:ecommerce/features/personalization/models/productModel.dart';
import 'package:ecommerce/screens/home/widgets/RoundedImage.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DProductImageSlider extends StatelessWidget {
  const DProductImageSlider({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Imagecontroller());
    final images = controller.getAllProductImages(productModel);
    controller.selectedImage.value = images.first;

    return ClipPath(
      clipper: DCustomeClipper(),
      child: Container(
        color: DHelperFunction.isDarkMode(context)
            ? DColors.darkGrey
            : DColors.light,
        child: Stack(
          children: [
            // Main Large image
            SizedBox(
              height: 400,

              child: Padding(
                padding: const EdgeInsets.all(DSizes.productImageRadius * 2),
                child: Obx(() {
                  final image = controller.selectedImage.value;

                  return GestureDetector(
                    onTap: () {
                      controller.showEnlargedImage(image);
                    },
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: DColors.primaryColor,
                            ),
                          ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  );
                }),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              left: DSizes.defaultSpacing,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      SizedBox(width: DSizes.spaceBtwItems),
                  shrinkWrap: true,
                  itemCount: images.length,
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final imageSelected =
                          controller.selectedImage.value == images[index];
                      return DRoundedImage(
                        width: 80,
                        height: 80,
                        backgroundColor: DHelperFunction.isDarkMode(context)
                            ? DColors.dark
                            : DColors.white,
                        isNetworkImage: true,
                        onpressed: () =>
                            controller.selectedImage.value = images[index],
                        border: Border.all(
                          color: imageSelected
                              ? DColors.primaryColor
                              : Colors.transparent,
                        ),

                        image: images[index],
                      );
                    });
                  },
                ),
              ),
            ),

            DAppBar(
              showBackArrow: true,

              actions: [
                DCircularIcon(
                  backgroundColor: DHelperFunction.isDarkMode(context)
                      ? DColors.dark
                      : DColors.white,
                  color: Colors.red,
                  icon: Iconsax.heart5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

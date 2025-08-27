import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/personalization/models/productModel.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Imagecontroller extends GetxController {
  static Imagecontroller get Instance => Get.find<Imagecontroller>();

  RxString selectedImage = "".obs;

  List<String> getAllProductImages(ProductModel product) {
    Set<String> images = {};
    images.add(product.thumbnail);

    if (product.images.isNotEmpty) {
      images.addAll(product.images);
    }
    if (product.variations.isNotEmpty || product.variations != null) {
      for (var variation in product.variations) {
        images.addAll(product.variations.map((e) => e.image).toList());
      }
    }
    return images
        .toList(); //to convert the set into list so that we can use it in our UI.
  }

  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                vertical: DSizes.defaultSpacing * 2,
                horizontal: DSizes.defaultSpacing,
              ),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: DSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Close"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce/features/personalization/controllers/cateogries/category.dart';
import 'package:ecommerce/screens/categories/categories.dart';
import 'package:ecommerce/screens/loading/DCateogryShimmer.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorPopular extends StatelessWidget {
  CategorPopular({super.key});
  final controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Dcateogryshimmer();
      }
      if (controller.futuaredcategories.isEmpty) {
        return Center(
          child: Text(
            'No categories found',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.white),
          ),
        );
      }
      return GestureDetector(
        onTap: () {},
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: DSizes.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                child: ListView.builder(
                  shrinkWrap: true,

                  itemCount: controller.allcategories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: DSizes.sm),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            CategoriesScreen(
                              title: controller.futuaredcategories[index].name,
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(
                                  10,
                                ), // adjust this value
                                child: ClipOval(
                                  child: Image.network(
                                    controller.futuaredcategories[index].image,
                                    fit: BoxFit.contain,
                                    errorBuilder:
                                        (context, error, stackTrace) => Icon(
                                          Icons.image_not_supported,
                                          color: Colors.grey,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: DSizes.spaceBtwItems / 2),
                            SizedBox(
                              width: 55,
                              child: Center(
                                child: Text(
                                  controller.futuaredcategories[index].name,
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

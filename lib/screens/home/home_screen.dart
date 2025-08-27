import 'package:ecommerce/common/product_cards/product_card_vertical.dart';
import 'package:ecommerce/common/widgets/curved_widget.dart';
import 'package:ecommerce/common/widgets/headline_title.dart';
import 'package:ecommerce/features/personalization/controllers/productController.dart';
import 'package:ecommerce/screens/home/widgets/categor_popular.dart';
import 'package:ecommerce/screens/home/widgets/grid_widget.dart';
import 'package:ecommerce/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce/screens/home/widgets/promoWidget.dart';
import 'package:ecommerce/screens/home/widgets/search_continar.dart';
import 'package:ecommerce/screens/loading/dShimmerProduct.dart';
import 'package:ecommerce/screens/products/product_screen.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<Map<String, String>> categories = [
    {
      'title': 'Shoes',
      'image': 'https://cdn-icons-png.flaticon.com/512/826/826939.png',
    },
    {
      'title': 'Watches',
      'image': 'https://cdn-icons-png.flaticon.com/512/3522/3522085.png',
    },
    {
      'title': 'Bags',
      'image': 'https://cdn-icons-png.flaticon.com/512/1086/1086933.png',
    },
    {
      'title': 'Clothes',
      'image': 'https://cdn-icons-png.flaticon.com/512/892/892458.png',
    },
    {
      'title': 'Electronics',
      'image': 'https://cdn-icons-png.flaticon.com/512/1042/1042330.png',
    },
    {
      'title': 'Beauty',
      'image': 'https://cdn-icons-png.flaticon.com/512/3303/3303893.png',
    },
    {
      'title': 'Toys',
      'image': 'https://cdn-icons-png.flaticon.com/512/4380/4380849.png',
    },
    {
      'title': 'Books',
      'image': 'https://cdn-icons-png.flaticon.com/512/1040/1040230.png',
    },
    {
      'title': 'Fitness',
      'image': 'https://cdn-icons-png.flaticon.com/512/3176/3176297.png',
    },
    {
      'title': 'Furniture',
      'image': 'https://cdn-icons-png.flaticon.com/512/2933/2933889.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DPrimaryContinar(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  DHomeAppBar(),
                  SizedBox(height: DSizes.spaceBtwSections),
                  // Search Bar
                  SearchBarWidget(text: 'Search in Store'),
                  SizedBox(height: DSizes.spaceBtwSections),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DSizes.defaultSpacing,
                    ),
                    child: Text(
                      'Popular Categories',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.apply(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: DSizes.spaceBtwItems),
                  //-- Categories
                  CategorPopular(),
                  SizedBox(height: DSizes.defaultSpacing * 2),
                ],
              ),
            ),
            // Body
            DPromoSlider(),

            Padding(
              padding: const EdgeInsets.only(
                left: DSizes.defaultSpacing,
                right: DSizes.defaultSpacing,
              ),
              child: headlineTitle(
                title: 'Popular Products',
                onpressed: () {
                  // Navigate to products screen
                  Get.to(ProductScreen());
                },
              ),
            ),

            Obx(() {
              // Show loading indicator while fetching products
              if (controller.isLoading.value) {
                return Dshimmerproduct();
              }

              // Show message if no products found
              if (controller.products.isEmpty) {
                return const Center(child: Text('No Products Found'));
              }

              // Show the grid of products
              return Padding(
                padding: const EdgeInsets.all(DSizes.defaultSpacing),
                child: GridWidget(
                  mainAxisExtent: 270,
                  itemCount: controller.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = controller.products[index];
                    return ProductCardVertical(
                      product: product, // Pass the product model to the card
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce/common/widgets/headline_title.dart';
import 'package:ecommerce/features/personalization/controllers/productController.dart';
import 'package:ecommerce/features/personalization/models/productModel.dart';
import 'package:ecommerce/screens/page%20view/reviw_rating.dart';
import 'package:ecommerce/screens/page%20view/widgets/Productattributes.dart';
import 'package:ecommerce/screens/page%20view/widgets/bottom_addCart.dart';
import 'package:ecommerce/screens/page%20view/widgets/productMeta.dart';
import 'package:ecommerce/screens/page%20view/widgets/product_imageSlider.dart';
import 'package:ecommerce/screens/page%20view/widgets/rating_share.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final productDisc = controller.calucalteSalePercntage(
      product.price,
      product.salePrice,
    );
    return Scaffold(
      bottomNavigationBar: DBottomAddCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1 - Product Image Slider
            DProductImageSlider(productModel: product),

            // 2- Product Details
            Padding(
              padding: EdgeInsetsGeometry.only(
                left: DSizes.defaultSpacing,
                right: DSizes.defaultSpacing,
                bottom: DSizes.defaultSpacing,
              ),
              child: Column(
                children: [
                  // -- Rating AND Share Button
                  DRatingAndShare(),

                  // - price title ,stock , brand
                  DProductMetaData(product: product),
                  SizedBox(height: DSizes.spaceBtwItems / 1.5),

                  // -- attributes
                  DProductAttributes(),

                  // -- Checkout Button
                  SizedBox(height: DSizes.spaceBtwSections),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, DSizes.buttonHeight),
                    ),
                    onPressed: () {},
                    child: Text('Checkout'),
                  ),
                  SizedBox(height: DSizes.spaceBtwSections),

                  // -- Description
                  headlineTitle(title: 'Description', showMoreItem: false),
                  SizedBox(height: DSizes.spaceBtwItems),
                  ReadMoreText(
                    textAlign: TextAlign.start,
                    product.description ??
                        'Step into comfort and performance with UrbanFlex™ Lightweight Running Shoes – the perfect fusion of modern design, breathable material, and enhanced sole support. Whether you\'re hitting the gym, going for a run, or just strolling through the city, these shoes are engineered to keep you moving effortlessly.\n\n'
                            'Key Features:\n'
                            '✅ Breathable Mesh Upper\n'
                            'Crafted with ultra-light, breathable knit mesh to keep your feet cool and dry even during intense activities.\n\n'
                            '✅ Shock-Absorbing EVA Midsole\n'
                            'Provides superior cushioning and impact resistance, reducing stress on joints and maximizing energy return.\n\n'
                            '✅ Non-Slip Rubber Outsole\n'
                            'High-traction, anti-slip rubber grip suitable for both wet and dry surfaces – keeping you safe and steady on every step.\n\n'
                            '✅ Ergonomic Fit\n'
                            'Designed to hug your foot comfortably with a snug, sock-like fit, offering full ankle support and flexibility.\n\n'
                            '✅ Lightweight & Travel-Friendly\n'
                            'Weighs under 250g per shoe – ideal for packing, travel, or all-day wear.\n\n'
                            '✅ Stylish & Versatile\n'
                            'Minimalist urban design available in multiple colors (Black, Navy Blue, White, and Grey), perfect for both athletic and casual outfits.',
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Divider(),
                  SizedBox(height: DSizes.spaceBtwItems),

                  // -- Reviews
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      headlineTitle(
                        title: 'Reviews (199)',
                        showMoreItem: false,
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(ReviwRatingPage());
                        },
                        icon: Icon(Iconsax.arrow_right_3),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

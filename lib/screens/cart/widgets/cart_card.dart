import 'package:ecommerce/common/widgets/RoundedContainer.dart';
import 'package:ecommerce/common/widgets/brand_title.dart';
import 'package:ecommerce/common/widgets/product_price.dart';
import 'package:ecommerce/common/widgets/product_title.dart';
import 'package:ecommerce/screens/cart/widgets/desc_product.dart';
import 'package:ecommerce/screens/cart/widgets/quantity.dart';
import 'package:ecommerce/screens/home/widgets/RoundedImage.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:flutter/material.dart';

class Cart_Card extends StatelessWidget {
  const Cart_Card({super.key, required this.dark, this.showQuantity = false});

  final bool dark;
  final bool showQuantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            DRoundedContinar(
              backgroundColor: dark ? DColors.darkGrey : DColors.grey,
              width: 50,
              height: 50,
              child: DRoundedImage(
                image:
                    'https://static.vecteezy.com/system/resources/previews/046/323/598/non_2x/pair-of-colorful-sports-shoes-for-active-lifestyle-png.png',
              ),
            ),
            SizedBox(width: DSizes.spaceBtwItems),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DBrandWithVertifedIcon(brandName: 'Nike'),

                ProductTitleText(title: 'Adidas Ultraboost', small: false),
                SizedBox(width: DSizes.spaceBtwItems),
                Row(
                  children: [
                    descProduct(subject: 'Color ', title: 'Red'),
                    SizedBox(width: DSizes.spaceBtwItems / 2),

                    descProduct(subject: 'Size ', title: '34 EU'),
                  ],
                ),
                SizedBox(height: DSizes.spaceBtwItems / 2),
              ],
            ),
          ],
        ),
        showQuantity
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                    children: [
                      SizedBox(width: 50),
                      DQuantityButtonWithAddRemove(),
                    ],
                  ),

                  Row(
                    children: [
                      ProductPriceText(price: '125,000', isLarge: true),
                    ],
                  ),
                ],
              )
            : SizedBox(),
      ],
    );
  }
}

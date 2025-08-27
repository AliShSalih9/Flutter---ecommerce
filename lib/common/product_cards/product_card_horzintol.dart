import 'package:ecommerce/common/styles/DShadow.dart';
import 'package:ecommerce/common/widgets/Circular_icon.dart';
import 'package:ecommerce/common/widgets/RoundedContainer.dart';
import 'package:ecommerce/common/widgets/brand_title.dart';
import 'package:ecommerce/common/widgets/product_price.dart';
import 'package:ecommerce/features/personalization/models/productModel.dart';
import 'package:ecommerce/screens/home/widgets/RoundedImage.dart';
import 'package:ecommerce/screens/page%20view/page_view.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardHorzintol extends StatelessWidget {
  const ProductCardHorzintol({super.key, this.product});
  final ProductModel? product;
  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Get.to(ProductDetail(product: product!));
      },
      child: Container(
        width: 310,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [Dshadow.horizontalProductShadow],
          borderRadius: BorderRadius.circular(DSizes.productImageRadius),
          color: dark ? DColors.darkGrey : DColors.white,
        ),
        child: Row(
          children: [
            DRoundedContinar(
              height: 120,
              padding: EdgeInsets.all(DSizes.sm),
              backgroundColor: dark ? DColors.dark : DColors.light,
              child: Stack(
                children: [
                  DRoundedImage(
                    image:
                        'https://www.pngmart.com/files/1/Nike-Shoes-Transparent-PNG.png',
                    applyImageRadius: true,
                  ),
                  Positioned(
                    top: 12,
                    child: DRoundedContinar(
                      borderRadius: DSizes.sm,
                      backgroundColor: DColors.secondary.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(
                        horizontal: DSizes.sm,
                        vertical: DSizes.xs,
                      ),
                      child: Text(
                        '75%',
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: Colors.black),
                      ),
                    ),
                  ),

                  //Favourite Icon
                  Positioned(
                    top: 0,
                    right: 0,
                    child: DCircularIcon(
                      backgroundColor: dark
                          ? DColors.darkGrey.withOpacity(0.9)
                          : DColors.white.withOpacity(0.9),
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: DSizes.spaceBtwItems / 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 175,
                  child: Text(
                    '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                
                ''',

                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                SizedBox(height: DSizes.spaceBtwItems / 2),
                DBrandWithVertifedIcon(brandName: 'Nike'),
                SizedBox(height: DSizes.spaceBtwItems / 2),
                SizedBox(
                  width: 185,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductPriceText(price: '290,000'),
                      Container(
                        decoration: BoxDecoration(
                          color: DColors.primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(DSizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              DSizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: SizedBox(
                          width: DSizes.iconLg * 1.2,
                          height: DSizes.iconLg * 1.2,

                          child: Center(
                            child: Icon(Iconsax.add, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

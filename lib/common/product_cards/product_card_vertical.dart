import 'package:ecommerce/common/styles/DShadow.dart';
import 'package:ecommerce/common/widgets/Circular_icon.dart';
import 'package:ecommerce/common/widgets/RoundedContainer.dart';
import 'package:ecommerce/common/widgets/brand_title.dart';
import 'package:ecommerce/common/widgets/product_price.dart';
import 'package:ecommerce/common/widgets/product_title.dart';
import 'package:ecommerce/features/personalization/controllers/productController.dart';
import 'package:ecommerce/features/personalization/models/productModel.dart';
import 'package:ecommerce/screens/home/widgets/RoundedImage.dart';
import 'package:ecommerce/screens/page%20view/page_view.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, this.product});
  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunction.isDarkMode(context);
    final controller = Get.put(ProductController());
   
    return GestureDetector(
      onTap: () {
        Get.to(ProductDetail(product: product!));
      },
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [Dshadow.verticalProductShadow],
          borderRadius: BorderRadius.circular(DSizes.productImageRadius),
          color: dark ? DColors.darkGrey : DColors.white,
        ),
        child: Column(
          children: [
            DRoundedContinar(
              height: 180,
              backgroundColor: dark ? DColors.grey : DColors.light,
              child: Stack(
                children: [
                  DRoundedImage(
                    image:
                        product?.thumbnail ??
                        'https://static.vecteezy.com/system/resources/previews/046/323/598/non_2x/pair-of-colorful-sports-shoes-for-active-lifestyle-png.png',
                    fit: BoxFit.contain,
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
                        '$productDisc%' ?? '0%',
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

            const SizedBox(height: DSizes.spaceBtwItems / 2),
            //Detalies
            Padding(
              padding: EdgeInsets.only(left: DSizes.sm, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(title: product?.title ?? 'Nike Air Max 270'),
                  SizedBox(height: DSizes.spaceBtwItems / 2),

                  DBrandWithVertifedIcon(
                    brandName: product?.brand!.name ?? 'Nike',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductPriceText(
                        price: controller.getProductPrice(product!)??'0',
                      ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce/common/widgets/RoundedContainer.dart';
import 'package:ecommerce/common/widgets/brand_title.dart';
import 'package:ecommerce/common/widgets/continar_circular.dart';
import 'package:ecommerce/common/widgets/product_price.dart';
import 'package:ecommerce/common/widgets/product_title.dart';
import 'package:ecommerce/features/personalization/controllers/productController.dart';
import 'package:ecommerce/features/personalization/models/productModel.dart';
import 'package:ecommerce/screens/home/widgets/RoundedImage.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:flutter/material.dart';

class DProductMetaData extends StatelessWidget {
  const DProductMetaData({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final discProduct = controller.calucalteSalePercntage(
      product.price,
      product.salePrice,
    );
    print(discProduct);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            DRoundedContinar(
              backgroundColor: DColors.secondary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(
                horizontal: DSizes.sm,
                vertical: DSizes.xs,
              ),
              child: Text(
                '$discProduct%',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: DColors.black),
              ),
            ),
            SizedBox(width: DSizes.spaceBtwItems),
            // Price
            Text(
              product.price.toString(),
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            SizedBox(width: DSizes.spaceBtwItems),
            ProductPriceText(price: '200,000', isLarge: true),
          ],
        ),
        SizedBox(height: DSizes.spaceBtwItems / 1.5),
        ProductTitleText(title: product.title, small: false),

        SizedBox(height: DSizes.spaceBtwItems / 1.5),

        ProductTitleText(title: 'Status', small: true),

        Text(
          controller.getProductStockStatus(product.stock),
          style: Theme.of(context).textTheme.titleMedium,
        ),

        SizedBox(height: DSizes.spaceBtwItems / 1.5),

        //Brand
        Row(
          children: [
            DCirculeContinar(
              width: 25,
              height: 25,
              child: DRoundedImage(
                width: 15,
                height: 15,
                fit: BoxFit.contain,
                image: product.brand!.image,
              ),
            ),
            SizedBox(width: DSizes.spaceBtwItems),

            DBrandWithVertifedIcon(brandName: 'Addidas'),
          ],
        ),
      ],
    );
  }
}

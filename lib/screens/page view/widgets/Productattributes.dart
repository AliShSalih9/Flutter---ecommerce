import 'package:ecommerce/common/widgets/RoundedContainer.dart';
import 'package:ecommerce/common/widgets/headline_title.dart';
import 'package:ecommerce/common/widgets/product_price.dart';
import 'package:ecommerce/common/widgets/product_title.dart';
import 'package:ecommerce/screens/page%20view/widgets/choiceChip.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class DProductAttributes extends StatelessWidget {
  const DProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // -- Selected Atturibute Pricing & Description
        DRoundedContinar(
          padding: EdgeInsetsGeometry.all(DSizes.md),
          backgroundColor: dark ? DColors.darkGrey : DColors.grey,
          child: Column(
            children: [
              /// title , price and stocks
              Row(
                children: [
                  headlineTitle(title: 'Variation', showMoreItem: false),
                  SizedBox(width: DSizes.spaceBtwItems / 1.5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ProductTitleText(title: 'price : ', small: true),

                          // actuqal price
                          Text(
                            '10,000 IQD',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: DSizes.spaceBtwItems / 1.5),
                          ProductPriceText(price: '5000', isLarge: true),
                        ],
                      ),
                      Row(
                        children: [
                          ProductTitleText(title: 'Stock : ', small: true),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              ProductTitleText(
                title:
                    'this is the Description of the Product and it can go up to max 4 lines.',
                small: true,
                maxLines: 4,
              ),
            ],
          ),
        ),

        SizedBox(height: DSizes.spaceBtwItems),
        //attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headlineTitle(title: 'Colors'),
            SizedBox(height: DSizes.spaceBtwItems / 2),

            Wrap(
              spacing: 8,
              children: [
                DChoiceChip(text: 'Red', Selected: true, onSelected: (bool) {}),
                DChoiceChip(
                  text: 'Green',
                  Selected: false,
                  onSelected: (bool) {},
                ),
                DChoiceChip(
                  text: 'Blue',
                  Selected: false,
                  onSelected: (bool) {},
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: DSizes.spaceBtwItems),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headlineTitle(title: 'Size'),
            SizedBox(height: DSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                DChoiceChip(
                  text: 'EU 34',
                  Selected: true,
                  onSelected: (value) {},
                ),
                DChoiceChip(
                  text: 'EU 36',
                  Selected: false,
                  onSelected: (value) {},
                ),
                DChoiceChip(
                  text: 'EU 38',
                  Selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

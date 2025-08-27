import 'package:ecommerce/common/widgets/RoundedContainer.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class order_card extends StatelessWidget {
  const order_card({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return DRoundedContinar(
      backgroundColor: dark ? DColors.darkGrey : DColors.grey,
      child: Padding(
        padding: const EdgeInsets.only(
          left: DSizes.md,
          right: DSizes.md,
          bottom: DSizes.md,
          top: DSizes.md,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Iconsax.ship5, size: DSizes.iconLg),
                    SizedBox(width: DSizes.spaceBtwItems),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pending Orders',
                          style: Theme.of(context).textTheme.titleSmall!.apply(
                            color: DColors.primaryColor,
                          ),
                        ),
                        Text(
                          '07 Nov 2024',
                          style: Theme.of(context).textTheme.headlineSmall!,
                        ),
                      ],
                    ),
                  ],
                ),

                IconButton(onPressed: () {}, icon: Icon(Iconsax.arrow_right_3)),
              ],
            ),
            SizedBox(height: DSizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Iconsax.discount_shape, size: DSizes.iconSm),
                    SizedBox(width: DSizes.spaceBtwItems),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          '[#392923]',
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Iconsax.send, size: DSizes.iconSm),
                    SizedBox(width: DSizes.spaceBtwItems),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipping Date',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          '07 Nov 2024',
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

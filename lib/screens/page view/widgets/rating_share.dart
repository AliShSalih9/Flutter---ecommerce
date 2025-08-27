import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DRatingAndShare extends StatelessWidget {
  const DRatingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Iconsax.star5, color: DColors.secondary),
            SizedBox(width: DSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '5.0 ',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(text: '(199)'),
                ],
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share, size: DSizes.iconMd),
        ),
      ],
    );
  }
}

import 'package:ecommerce/common/widgets/Circular_icon.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DQuantityButtonWithAddRemove extends StatelessWidget {
  const DQuantityButtonWithAddRemove({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DCircularIcon(
          icon: Iconsax.minus,
          size: 12,
          backgroundColor: DColors.grey,
          width: 30,
          color: Colors.white,
          height: 30,
        ),
        SizedBox(width: DSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: DSizes.spaceBtwItems),

        DCircularIcon(
          icon: Iconsax.add,
          size: 12,
          backgroundColor: DColors.primaryColor,
          color: Colors.white,
          width: 30,
          height: 30,
        ),
      ],
    );
  }
}

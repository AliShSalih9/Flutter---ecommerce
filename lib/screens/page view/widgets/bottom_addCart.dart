import 'package:ecommerce/common/widgets/Circular_icon.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DBottomAddCart extends StatelessWidget {
  const DBottomAddCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunction.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: DSizes.defaultSpacing,
        vertical: DSizes.defaultSpacing / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? DColors.darkGrey : DColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(DSizes.cardRadiusLg),
          topRight: Radius.circular(DSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              DCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: DColors.grey,
                width: 40,
                color: Colors.white,
                height: 40,
              ),
              SizedBox(width: DSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              SizedBox(width: DSizes.spaceBtwItems),

              DCircularIcon(
                icon: Iconsax.add,
                backgroundColor: DColors.dark,
                color: Colors.white,
                width: 40,
                height: 40,
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(DSizes.buttonWidth, DSizes.buttonHeight),
            ),
            onPressed: () {},
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}

import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = false,
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DSizes.defaultSpacing),
      child: Container(
        padding: EdgeInsets.only(left: 10),
        height: 50,
        decoration: BoxDecoration(
          color: showBackground
              ? dark
                    ? DColors.dark
                    : DColors.light
              : null,
          borderRadius: BorderRadius.circular(10),
          border: showBorder ? Border.all(color: Colors.grey) : null,
        ),
        child: Row(
          children: [
            Icon(Iconsax.search_normal, color: Colors.grey),
            SizedBox(width: DSizes.spaceBtwItems),
            Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.apply(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

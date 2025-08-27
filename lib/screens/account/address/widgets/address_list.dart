import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class addressList extends StatelessWidget {
  const addressList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: DColors.primaryColor.withOpacity(0.2),
        border: BoxBorder.all(
          width: 1,
          color: DHelperFunction.isDarkMode(context)
              ? DColors.darkContainer
              : DColors.lightContainer,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DSizes.defaultSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Omer Salah',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Checkbox(
                  shape: CircleBorder(),
                  value: true,
                  checkColor: DColors.primaryColor,
                  onChanged: (value) {},
                ),
              ],
            ),
            SizedBox(height: DSizes.spaceBtwItems / 2),
            Text(
              '(+964) 7507686271',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(height: DSizes.spaceBtwItems / 2),
            Text(
              'Duhok Governorate Iraq',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              'Kurdistan Iraq',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}

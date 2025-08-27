import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/device/device_utlites.dart';
import 'package:flutter/material.dart';

class DRatingProgressLinear extends StatelessWidget {
  const DRatingProgressLinear({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        SizedBox(width: DSizes.spaceBtwItems),
        Expanded(
          child: SizedBox(
            width: DDeviceUtility.getScreenWidth(context) * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: LinearProgressIndicator(
                value: value,
                minHeight: 11,
                backgroundColor: DColors.grey,
                valueColor: AlwaysStoppedAnimation(DColors.primaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

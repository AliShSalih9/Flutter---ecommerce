import 'package:ecommerce/screens/loading/dShimmerEffect.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';

class Dcateogryshimmer extends StatelessWidget {
  const Dcateogryshimmer({super.key, this.count = 6});
  final int count;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        separatorBuilder: (ctx, index) => SizedBox(width: DSizes.spaceBtwItems),
        itemCount: 15,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Column(
          children: [
            Dshimmereffect(width: 55, height: 55, radius: 55),
            SizedBox(height: DSizes.spaceBtwItems / 2),
            Dshimmereffect(height: 8, width: 55),
          ],
        ),
      ),
    );
  }
}

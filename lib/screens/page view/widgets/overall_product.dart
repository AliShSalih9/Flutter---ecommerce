import 'package:ecommerce/screens/page%20view/widgets/rating_progress.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';

class OverallProductRating extends StatelessWidget {
  const OverallProductRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text('5.0', style: Theme.of(context).textTheme.displayLarge),
        ),
        SizedBox(width: DSizes.spaceBtwItems),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              DRatingProgressLinear(title: '5', value: 0.3),

              DRatingProgressLinear(title: '4', value: 0.9),
              DRatingProgressLinear(title: '3', value: 0.6),
              DRatingProgressLinear(title: '2', value: 0.7),
              DRatingProgressLinear(title: '1', value: 0.4),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/screens/page%20view/widgets/overall_product.dart';
import 'package:ecommerce/screens/page%20view/widgets/ratingBar.dart';
import 'package:ecommerce/screens/page%20view/widgets/user_review.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';

class ReviwRatingPage extends StatelessWidget {
  const ReviwRatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(DSizes.defaultSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rating and reviews are verified and are from people who use the same type of device that you use',
              ),
              SizedBox(height: DSizes.spaceBtwItems),
              // overal product ratings
              OverallProductRating(),
              RatingBarIndector(rating: 2.5),
              Text('12.111', style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: DSizes.spaceBtwSections),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => UserReviewCard(),
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: DSizes.spaceBtwItems);
                },
                itemCount: 5,
              ),

              /// User Review List
            ],
          ),
        ),
      ),
    );
  }
}

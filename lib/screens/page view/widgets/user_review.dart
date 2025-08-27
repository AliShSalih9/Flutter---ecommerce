import 'package:ecommerce/common/widgets/RoundedContainer.dart';
import 'package:ecommerce/screens/page%20view/widgets/ratingBar.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://img-estaticos.atleticodemadrid.com/system/fotos/11003/destacado_600x600/BUSTO_0018_9_SUAREZ.png?1601661990',
                  ),
                ),
                SizedBox(width: DSizes.spaceBtwItems),
                Text(
                  'Luis Suarez',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        SizedBox(height: DSizes.spaceBtwItems / 2),

        //Review
        Row(
          children: [
            RatingBarIndector(rating: 4.5),
            SizedBox(width: DSizes.spaceBtwItems),
            Text('05 Nov, 2022', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: DSizes.spaceBtwItems),
        ReadMoreText(
          """Omer has completed the task successfully.
His work shows attention to detail and strong effort.
Everything was delivered on time and as expected.
Communication throughout the process was clear and consistent.
Overall, Omer has done an excellent job!""",
          trimLines: 2,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: DColors.primaryColor,
          ),
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: DColors.primaryColor,
          ),
        ),
        SizedBox(height: DSizes.spaceBtwItems),
        DRoundedContinar(
          backgroundColor: dark ? DColors.darkGrey : Colors.grey,
          child: Padding(
            padding: EdgeInsetsGeometry.all(DSizes.defaultSpacing),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('D Store '),
                    Text(
                      '06 Nov, 2022',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: DSizes.spaceBtwItems),
                ReadMoreText(
                  """Omer has completed the task successfully.
His work shows attention to detail and strong effort.
Everything was delivered on time and as expected.
Communication throughout the process was clear and consistent.
Overall, Omer has done an excellent job!""",
                  trimLines: 2,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: DColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

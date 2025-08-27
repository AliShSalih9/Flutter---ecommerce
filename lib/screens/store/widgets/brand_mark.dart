import 'package:ecommerce/common/brands/brand_card.dart';
import 'package:ecommerce/common/product_cards/product_card_vertical.dart';
import 'package:ecommerce/common/widgets/RoundedContainer.dart';
import 'package:ecommerce/common/widgets/headline_title.dart';
import 'package:ecommerce/screens/home/widgets/grid_widget.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class BrandMark extends StatelessWidget {
  const BrandMark({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsGeometry.all(DSizes.defaultSpacing),
        child: Column(
          children: [
            // -- Brands
            DRoundedContinar(
              showBorder: true,
              backgroundColor: Theme.of(context).cardColor,
              margin: EdgeInsets.all(DSizes.spaceBtwItems),
              child: Column(
                children: [
                  DBrandCard(
                    showBorder: false,
                    brandName: 'Nike',
                    imageUrl:
                        'https://cdn-icons-png.flaticon.com/512/732/732084.png',
                    productCount: 245,
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < 3; i++)
                        DRoundedContinar(
                          height: 100,
                          backgroundColor: DHelperFunction.isDarkMode(context)
                              ? DColors.darkGrey
                              : DColors.light,
                          margin: EdgeInsets.all(DSizes.sm),
                          padding: EdgeInsets.all(DSizes.sm),
                          child: Image(
                            width: 64,
                            height: 45,
                            fit: BoxFit.contain,
                            image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqJ9ptmf0AJ7qDShOpf74b8Y0PGfJskYgk5A&s',
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: DSizes.spaceBtwItems),
            // -- Products
            headlineTitle(title: 'You Might Like'),
            GridWidget(
              mainAxisExtent: 270,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ProductCardVertical(
                  
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

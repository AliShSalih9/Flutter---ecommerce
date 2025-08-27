import 'package:ecommerce/common/product_cards/product_card_horzintol.dart';
import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/common/widgets/headline_title.dart';
import 'package:ecommerce/screens/home/widgets/RoundedImage.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(title: Text(title), showBackArrow: true),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DRoundedImage(
                image:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgBh08mzDT5OVw7v_IW74GRZlZnhzEHmIk4A&s',
              ),
              SizedBox(height: DSizes.spaceBtwItems),
              headlineTitle(title: 'Sport Shoes', onpressed: () {}),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  separatorBuilder: (ctx, index) =>
                      SizedBox(width: DSizes.spaceBtwItems),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (_, index) => ProductCardHorzintol(),
                  itemCount: 4,
                ),
              ),
                 SizedBox(height: DSizes.spaceBtwItems),
              headlineTitle(title: 'Sport Shoes', onpressed: () {}),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  separatorBuilder: (ctx, index) =>
                      SizedBox(width: DSizes.spaceBtwItems),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (_, index) => ProductCardHorzintol(),
                  itemCount: 4,
                ),
              ),
                 SizedBox(height: DSizes.spaceBtwItems),
              headlineTitle(title: 'Sport Shoes', onpressed: () {}),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  separatorBuilder: (ctx, index) =>
                      SizedBox(width: DSizes.spaceBtwItems),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (_, index) => ProductCardHorzintol(),
                  itemCount: 4,
                ),
              ),
                 SizedBox(height: DSizes.spaceBtwItems),
              headlineTitle(title: 'Sport Shoes', onpressed: () {}),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  separatorBuilder: (ctx, index) =>
                      SizedBox(width: DSizes.spaceBtwItems),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (_, index) => ProductCardHorzintol(),
                  itemCount: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

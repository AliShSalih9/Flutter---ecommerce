import 'package:ecommerce/common/brands/brand_card.dart';
import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/screens/home/widgets/grid_widget.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DSizes.defaultSpacing),
          child: GridWidget(
            itemCount: 25,
            mainAxisExtent: 75,
            itemBuilder: (ctx, index) => DBrandCard(
              brandName: 'Nike',

              imageUrl:
                  'https://cdn.freebiesupply.com/logos/large/2x/nike-4-logo-png-transparent.png',
              productCount: 35,
            ),
          ),
        ),
      ),
    );
  }
}

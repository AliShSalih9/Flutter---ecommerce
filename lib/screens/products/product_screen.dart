import 'package:ecommerce/common/product_cards/product_card_vertical.dart';
import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/screens/home/widgets/grid_widget.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(title: Text('Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DSizes.defaultSpacing),
          child: Column(
            children: [
              DropdownButtonFormField(
                decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                items:
                    [
                      'Name',
                      'Higer Price',
                      'Lower Price',
                      'Sale',
                      'Newst',
                      'Popularity',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                onChanged: (value) {},
              ),
              SizedBox(height: DSizes.spaceBtwSections),
              GridWidget(
                mainAxisExtent: 271,
                itemCount: 10,
                itemBuilder: (contex, index) {
                  return ProductCardVertical();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

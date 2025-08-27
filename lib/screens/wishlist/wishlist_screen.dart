import 'package:ecommerce/common/product_cards/product_card_vertical.dart';
import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/screens/home/widgets/grid_widget.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        title: Text('Wishlist'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Iconsax.add))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(DSizes.defaultSpacing),
          child: GridWidget(
            mainAxisExtent: 270,
            itemCount: 6,
            itemBuilder: (_, index) {
              return ProductCardVertical();
            },
          ),
        ),
      ),
    );
  }
}

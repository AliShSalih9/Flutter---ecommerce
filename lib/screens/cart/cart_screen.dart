import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/screens/cart/widgets/cart_card.dart';
import 'package:ecommerce/screens/checkout/checoutScreen.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: DAppBar(title: Text('Cart'), showBackArrow: true),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          right: DSizes.defaultSpacing,
          left: DSizes.defaultSpacing,
          bottom: DSizes.defaultSpacing,
        ),
        child: ElevatedButton(
          onPressed: () {
            Get.to(Checoutscreen());
          },
          child: Text('Checkout 25000 IQD'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpacing),
          child: ListView.separated(
            separatorBuilder: (ctx, index) =>
                SizedBox(height: DSizes.spaceBtwItems),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) =>
                Cart_Card(dark: dark, showQuantity: true),
            itemCount: 54,
          ),
        ),
      ),
    );
  }
}

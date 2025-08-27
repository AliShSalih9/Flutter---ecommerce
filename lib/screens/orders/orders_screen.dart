import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/screens/orders/widgets/order_card.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: DAppBar(title: Text('My Orders'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpacing),
          child: ListView.separated(
            separatorBuilder: (ctx, index) =>
                SizedBox(height: DSizes.spaceBtwItems),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) => order_card(dark: dark),
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}

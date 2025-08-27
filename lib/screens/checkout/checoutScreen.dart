import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/screens/cart/widgets/cart_card.dart';
import 'package:ecommerce/screens/checkout/widgets/payment_widget.dart';
import 'package:ecommerce/screens/checkout/widgets/promo_code.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class Checoutscreen extends StatelessWidget {
  const Checoutscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(title: Text('Order Review'), showBackArrow: true),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.only(
          bottom: DSizes.defaultSpacing,
          left: DSizes.defaultSpacing,
          right: DSizes.defaultSpacing,
        ),
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Checkout 155,000IQD'),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpacing),
          child: Column(
            children: [
              // Card
              ListView.separated(
                separatorBuilder: (ctx, index) =>
                    SizedBox(height: DSizes.spaceBtwItems),
                physics: NeverScrollableScrollPhysics(),

                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (ctx, index) => Cart_Card(
                  dark: DHelperFunction.isDarkMode(context),
                  showQuantity: false,
                ),
              ),
              SizedBox(height: DSizes.spaceBtwItems),
              // promo Code
              DPromoCode(),
              SizedBox(height: DSizes.spaceBtwSections),

              // payment  and order total
              DPayment_Widget(),
            ],
          ),
        ),
      ),
    );
  }
}

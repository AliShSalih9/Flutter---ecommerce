import 'package:ecommerce/common/widgets/RoundedContainer.dart';
import 'package:ecommerce/screens/home/widgets/RoundedImage.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';

class DPayment_Widget extends StatelessWidget {
  const DPayment_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return DRoundedContinar(
      showBorder: true,
      child: Padding(
        padding: EdgeInsetsGeometry.all(DSizes.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            //sub total
            orderPrice_widget(title: 'Subtotal', price: '155,000 IQD'),
            SizedBox(height: DSizes.spaceBtwItems / 2),
            orderPrice_widget(title: 'Shipping Fee', price: '155,000 IQD'),
            SizedBox(height: DSizes.spaceBtwItems / 2),
            orderPrice_widget(title: 'Tax', price: '155,000 IQD'),

            SizedBox(height: DSizes.spaceBtwItems),
            orderPrice_widget(
              title: 'Order Total',
              price: '155,000 IQD',
              isLarge: true,
            ),
            //Divdir
            Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Method',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(onPressed: () {}, child: Text('Change')),
              ],
            ),
            Row(
              children: [
                DRoundedImage(
                  image:
                      'https://fib.iq/wp-content/uploads/2024/08/Mobile-FIB-Magzin.png',
                  width: 25,
                  height: 25,
                ),
                SizedBox(width: DSizes.spaceBtwItems),
                Text(
                  'First iraq bank',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(height: DSizes.spaceBtwItems),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping Address',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(onPressed: () {}, child: Text('Change')),
              ],
            ),
            Text('Ali Shamal Salih'),
            SizedBox(height: DSizes.spaceBtwItems / 2),

            Row(
              children: [
                Icon(Icons.phone, size: DSizes.iconSm),
                SizedBox(width: DSizes.spaceBtwItems),
                Text(
                  '+9647507686271',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            SizedBox(height: DSizes.spaceBtwItems / 2),

            Row(
              children: [
                Icon(Icons.location_city, size: DSizes.iconSm),
                SizedBox(width: DSizes.spaceBtwItems),
                Text(
                  'Akre Shorash ',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class orderPrice_widget extends StatelessWidget {
  const orderPrice_widget({
    super.key,
    required this.title,
    required this.price,
    this.isLarge = false,
  });
  final String title;
  final String price;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: isLarge
              ? Theme.of(context).textTheme.bodyLarge
              : Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          price,
          style: isLarge
              ? Theme.of(context).textTheme.titleSmall
              : Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

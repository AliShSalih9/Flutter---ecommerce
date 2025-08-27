import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  const ProductPriceText({
    super.key,
    this.currencySign = ' IQD',
    required this.price,
    this.maxlines = 1,
    this.isLarge = false,
    this.lineThrought = false,
  });
  final String currencySign, price;
  final int maxlines;
  final bool isLarge;
  final bool lineThrought;

  @override
  Widget build(BuildContext context) {
    return Text(
      price + currencySign,
      maxLines: 1,
      style: isLarge
          ? Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lineThrought ? TextDecoration.lineThrough : null,
            )
          : Theme.of(context).textTheme.labelLarge!.apply(
              decoration: lineThrought ? TextDecoration.lineThrough : null,
            ),
    );
  }
}

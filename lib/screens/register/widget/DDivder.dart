import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';

class DFormDivder extends StatelessWidget {
  const DFormDivder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            indent: 35,
            color: Colors.grey,
            height: DSizes.dividerHeight,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: DSizes.sm),
          child: Text(
            'Or continue with',
            style: TextStyle(fontSize: DSizes.fontSizeSm),
          ),
        ),
        Expanded(
          child: Divider(
            endIndent: 35,
            color: Colors.grey,
            height: DSizes.dividerHeight,
          ),
        ),
      ],
    );
  }
}

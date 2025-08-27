import 'package:ecommerce/common/widgets/RoundedContainer.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class DPromoCode extends StatelessWidget {
  const DPromoCode({super.key});

  @override
  Widget build(BuildContext context) {
    return DRoundedContinar(
      showBorder: true,
      child: Padding(
        padding: const EdgeInsets.only(
          top: DSizes.sm,
          bottom: DSizes.sm,
          right: DSizes.sm,
          left: DSizes.md,
        ),
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Have a promo enter ',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              width: 80,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: DHelperFunction.isDarkMode(context)
                      ? DColors.white.withOpacity(0.4)
                      : DColors.black.withOpacity(0.4),
                  backgroundColor: Colors.grey.withOpacity(0.2),

                  side: BorderSide.none,
                ),
                child: Text('Apply'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

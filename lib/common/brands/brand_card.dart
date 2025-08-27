import 'package:ecommerce/common/widgets/RoundedContainer.dart';
import 'package:ecommerce/common/widgets/brand_title.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class DBrandCard extends StatelessWidget {
  final String brandName;
  final String imageUrl;
  final int productCount;
  final bool showBorder;

  const DBrandCard({
    super.key,
    required this.brandName,
    required this.imageUrl,
    required this.productCount,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = DHelperFunction.isDarkMode(context);
    final iconBgColor = isDark ? DColors.black : DColors.white;
    final iconColor = isDark ? DColors.white : DColors.black;

    return GestureDetector(
      onTap: () {},
      child: DRoundedContinar(
        padding: const EdgeInsets.all(12),
        backgroundColor: Theme.of(context).cardColor,
        showBorder: showBorder,
        borderRadius: 16,

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Circular Logo
            Container(
              width: 35,
              height: 35,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Image.network(
                imageUrl,
                color: iconColor,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(width: 12),

            // Texts
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DBrandWithVertifedIcon(
                  brandName: brandName,
                  textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                ),
                const SizedBox(height: 4),
                Text(
                  '$productCount Products',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

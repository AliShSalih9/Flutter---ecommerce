import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DBrandWithVertifedIcon extends StatelessWidget {
  final String brandName;
  final Color iconColor;
  final double iconSize;
  final TextStyle? textStyle;
  final bool showIcon;

  const DBrandWithVertifedIcon({
    super.key,
    required this.brandName,
    this.iconColor = Colors.blue,
    this.iconSize = 16,
    this.textStyle,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          brandName,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: textStyle ?? Theme.of(context).textTheme.labelMedium,
        ),
        if (showIcon) ...[
          const SizedBox(width: 4),
          Icon(Iconsax.verify5, color: iconColor, size: iconSize),
        ],
      ],
    );
  }
}

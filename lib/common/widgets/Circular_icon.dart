import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';

class DCircularIcon extends StatelessWidget {
  const DCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = DSizes.lg,
    this.icon,
    this.color,
    this.backgroundColor,
    this.onpressed,
  });

  final double? width, height, size;
  final IconData? icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, size: size, color: color),
      ),
    );
  }
}

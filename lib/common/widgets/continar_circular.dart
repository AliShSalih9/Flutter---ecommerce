import 'package:ecommerce/utils/constant/colors.dart';
import 'package:flutter/material.dart';

class DCirculeContinar extends StatelessWidget {
  const DCirculeContinar({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.background = DColors.light,
    this.child,
    this.margin,
  });
  final double width;
  final double height;
  final double radius;
  final double padding;
  final EdgeInsetsGeometry? margin;
  final Color background;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,

      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      padding: EdgeInsets.all(padding),
      child: child,
    );
  }
}

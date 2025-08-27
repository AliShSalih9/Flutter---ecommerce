import 'package:flutter/material.dart';

class DRoundedContinar extends StatelessWidget {
  const DRoundedContinar({
    super.key,
    this.width,
    this.height,
    required this.child,
    this.backgroundColor,
    this.borderRadius = 10,
    this.padding,
    this.margin,
    this.showBorder = false,
  });
  final double? width, height;
  final Widget child;
  final Color? backgroundColor;
  final bool showBorder;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        border: showBorder ? Border.all(color: Colors.grey, width: 0.4) : null,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      child: child,
    );
  }
}

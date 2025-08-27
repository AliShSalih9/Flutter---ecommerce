import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';

class DRoundedImage extends StatelessWidget {
  const DRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.image,
    this.applyImageRadius = true,
    this.fit = BoxFit.cover,
    this.padding,
    this.isNetworkImage = true,
    this.onpressed,
    this.backgroundColor,
    this.border,
  });
  final double? width, height;
  final String image;
  final bool applyImageRadius;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onpressed;
  final Color? backgroundColor;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DSizes.md),
          color: backgroundColor,
          border: border,
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadiusGeometry.circular(DSizes.md)
              : BorderRadiusGeometry.zero,
          child: Image(
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error, color: Colors.red, size: 50);
            },
            image: isNetworkImage
                ? NetworkImage(image)
                : AssetImage(image) as ImageProvider,
            fit: fit,
          ),
        ),
      ),
    );
  }
}

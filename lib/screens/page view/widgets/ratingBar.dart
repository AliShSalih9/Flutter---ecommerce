import 'package:ecommerce/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class RatingBarIndector extends StatelessWidget {
  const RatingBarIndector({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      itemBuilder: (_, index) =>
          Icon(Iconsax.star1, color: DColors.primaryColor),
    );
  }
}

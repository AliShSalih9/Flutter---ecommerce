import 'package:ecommerce/utils/constant/colors.dart';
import 'package:flutter/widgets.dart';

class Dshadow {
  static final verticalProductShadow = BoxShadow(
    color: DColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: Offset(0, 2),
  );
  static final horizontalProductShadow = BoxShadow(
    color: DColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: Offset(2, 0),
    );
}

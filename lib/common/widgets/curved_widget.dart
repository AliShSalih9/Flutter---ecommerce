import 'package:ecommerce/common/widgets/continar_circular.dart';
import 'package:ecommerce/common/widgets/customer_clipper.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:flutter/material.dart';

class DPrimaryContinar extends StatelessWidget {
  const DPrimaryContinar({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DCustomeClipper(),
      child: Container(
        color: DColors.primaryColor,
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: DCirculeContinar(
                  background: DColors.light.withOpacity(0.1),
                ),
              ),
              Positioned(
                bottom: -150,
                right: -250,
                child: DCirculeContinar(
                  background: DColors.light.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

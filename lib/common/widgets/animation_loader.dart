import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DAnimationLoader extends StatelessWidget {
  const DAnimationLoader({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            animation,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          const SizedBox(height: DSizes.defaultSpacing),
          Text(text, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: DSizes.defaultSpacing),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(actionText ?? 'Action'),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

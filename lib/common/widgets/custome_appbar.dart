import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.showBackArrow = false,
  });
  final Widget? title;
  final List<Widget>? actions;
  final IconData? leadingIcon;
  final bool showBackArrow;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: DSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                icon: Icon(leadingIcon ?? Icons.arrow_back),
                onPressed: () => Get.back(),
              )
            : null,
        title: title,
        actions: actions,
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

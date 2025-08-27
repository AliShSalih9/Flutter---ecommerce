import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/device/device_utlites.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class DTabBar extends StatelessWidget implements PreferredSize {
  const DTabBar({super.key, required this.tabs});
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,

      indicatorColor: DColors.primaryColor,
      labelColor: DHelperFunction.isDarkMode(context)
          ? DColors.white
          : DColors.primaryColor,
      tabs: tabs,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(DDeviceUtility.getAppBarHeight());
}

import 'package:ecommerce/screens/account/profile_screen.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/store/store_screen.dart';
import 'package:ecommerce/screens/wishlist/wishlist_screen.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DBottomNav extends StatelessWidget {
  DBottomNav({super.key});
  final List<Widget> screens = [
    HomeScreen(),
    StoreScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];
  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            selectedIndex: controller.currentIndex.value,
            elevation: 0,
            backgroundColor: Colors.transparent,
            indicatorColor: DColors.primaryColor.withOpacity(0.2),

            onDestinationSelected: (index) {
              controller.PageChanged(index);
            },

            height: 80,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.store), label: 'Store'),
              NavigationDestination(
                icon: Icon(Iconsax.heart5),
                label: 'Wishlist',
              ),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
        body: Obx(() => screens[controller.currentIndex.value]),
      ),
    );
  }
}

class NavigationController extends GetxController {
  var currentIndex = 0.obs;

  void PageChanged(int index) {
    currentIndex.value = index;
  }
}

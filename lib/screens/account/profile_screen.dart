import 'package:ecommerce/common/widgets/headline_title.dart';
import 'package:ecommerce/data/repositories/auth/authentication_repository.dart';
import 'package:ecommerce/screens/account/address/address_screen.dart';
import 'package:ecommerce/screens/account/widgets/account_header.dart';
import 'package:ecommerce/screens/account/widgets/settings_menu.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/orders/orders_screen.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            AccountHeader(),
            SizedBox(height: DSizes.spaceBtwItems),
            //Body
            headlineTitle(title: 'Account Settings', showMoreItem: false),
            DSettingMenuTile(
              title: 'Address Details',
              subTitle: 'Manage your shipping destination',

              onTab: () {
                Get.to(AddressScreen());
              },
              icon: Iconsax.safe_home,
            ),
            DSettingMenuTile(
              title: 'My Cart',
              subTitle: 'Manage your items and proceed to checkout',

              onTab: () {
                Get.to(CartScreen());
              },
              icon: Iconsax.shopping_cart,
            ),
            DSettingMenuTile(
              title: 'My Orders',
              subTitle: 'In-progress and complate orders',

              onTab: () {
                Get.to(OrdersScreen());
              },
              icon: Iconsax.bag_tick,
            ),
            DSettingMenuTile(
              title: 'Bank Account',
              subTitle: 'Withdraw balance to registered bank account',

              onTab: () {},
              icon: Iconsax.bank,
            ),
            DSettingMenuTile(
              title: 'My Coupons',
              subTitle: 'List of all the discounted coupons',

              onTab: () {},
              icon: Iconsax.discount_shape,
            ),

            DSettingMenuTile(
              title: 'Notification',
              subTitle: 'Set any kind of notification message',

              onTab: () {},
              icon: Iconsax.notification,
            ),
            DSettingMenuTile(
              title: 'Account Privacy',
              subTitle: 'Manage data usage and connected accounts',

              onTab: () {},
              icon: Iconsax.security_card,
            ),
            SizedBox(height: DSizes.spaceBtwItems),
            headlineTitle(title: 'App Settings', showMoreItem: false),
            DSettingMenuTile(
              title: 'Load Data',
              subTitle: 'Upload data to your Cloud Firebase',

              onTab: () {},
              icon: Iconsax.document_upload,
            ),
            DSettingMenuTile(
              title: 'Geolocation',
              subTitle: 'Set recomendation based on location',
              traling: Switch(value: false, onChanged: (index) {}),

              onTab: () {},
              icon: Iconsax.location,
            ),
            DSettingMenuTile(
              title: 'Safe Mode',
              subTitle: 'search result is safe for all ages',
              traling: Switch(value: true, onChanged: (index) {}),

              onTab: () {},
              icon: Iconsax.security_user,
            ),
            DSettingMenuTile(
              title: 'HD Image Quality',
              subTitle: 'Set image quality to be seen ',
              traling: Switch(value: true, onChanged: (index) {}),

              onTab: () {},
              icon: Iconsax.image,
            ),
            SizedBox(height: DSizes.spaceBtwSections),
            Padding(
              padding: const EdgeInsets.all(DSizes.defaultSpacing),
              child: OutlinedButton(
                onPressed: () => AuthenticationRepository.instance.logout(),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 60),
                  side: BorderSide(
                    color: DHelperFunction.isDarkMode(context)
                        ? DColors.accent
                        : DColors.dark,
                  ),
                ),
                child: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/utils/constant/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DHomeAppBar extends StatelessWidget {
  DHomeAppBar({super.key});
  final controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return DAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DTexts.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: Colors.grey.shade300),
          ),
          Obx(
            () => Text(
              DTexts.homAppbarSubTitle +
                  (controller.user.value.fullName.isNotEmpty
                      ? controller.user.value.fullName
                      : 'Shopping app'),
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.apply(color: Colors.white),
            ),
          ),
        ],
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Get.to(CartScreen());
              },
              icon: Icon(Iconsax.shopping_bag, color: Colors.white),
            ),
            Positioned(
              top: 3,
              right: 3,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),

                child: Center(
                  child: Text(
                    '2',
                    style: TextStyle(fontSize: 8, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

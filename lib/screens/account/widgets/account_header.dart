import 'package:ecommerce/common/widgets/continar_circular.dart';
import 'package:ecommerce/common/widgets/curved_widget.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/screens/account/profile.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AccountHeader extends StatelessWidget {
  AccountHeader({super.key});
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return DPrimaryContinar(
      child: Padding(
        padding: const EdgeInsets.all(DSizes.defaultSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.apply(color: Colors.white),
            ),
            SizedBox(height: DSizes.spaceBtwSections),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    DCirculeContinar(
                      background: DHelperFunction.isDarkMode(context)
                          ? DColors.darkGrey
                          : DColors.light,
                      width: 55,
                      height: 55,
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(100),
                        child: Image(
                          fit: BoxFit.cover,

                          image:
                              (userController.user.value.imagePath != null &&
                                  userController
                                      .user
                                      .value
                                      .imagePath!
                                      .isNotEmpty)
                              ? NetworkImage(
                                  userController.user.value.imagePath!,
                                )
                              : const NetworkImage(
                                  'https://static.vecteezy.com/system/resources/previews/009/397/835/non_2x/man-avatar-clipart-illustration-free-png.png',
                                ),
                        ),
                      ),
                    ),
                    SizedBox(width: DSizes.spaceBtwItems),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userController.user.value.fullName ?? '',
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall!.apply(color: Colors.white),
                        ),
                        Text(
                          userController.user.value.email ?? '',
                          style: Theme.of(
                            context,
                          ).textTheme.labelMedium!.apply(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),

                IconButton(
                  onPressed: () {
                    Get.to(Profile());
                  },
                  icon: Icon(Iconsax.edit, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: DSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}

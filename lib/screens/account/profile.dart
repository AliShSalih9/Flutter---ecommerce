import 'package:ecommerce/common/widgets/continar_circular.dart';
import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/common/widgets/headline_title.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/screens/account/update_name.dart';
import 'package:ecommerce/screens/account/widgets/menu_Profile.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: DAppBar(title: Text('Profile'), showBackArrow: true),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpacing),
          child: Column(
            children: [
              Center(
                child: DCirculeContinar(
                  width: 75,
                  height: 75,
                  background: DHelperFunction.isDarkMode(context)
                      ? DColors.darkGrey
                      : DColors.light,

                  child: Obx(
                    () => ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(100),
                      child: Image(
                        image:
                            (userController.user.value.imagePath != null &&
                                userController.user.value.imagePath!.isNotEmpty)
                            ? NetworkImage(userController.user.value.imagePath!)
                            : const NetworkImage(
                                'https://static.vecteezy.com/system/resources/previews/009/397/835/non_2x/man-avatar-clipart-illustration-free-png.png',
                              ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: DSizes.spaceBtwItems),
              TextButton(
                onPressed: () => controller.UploadUserProfilePicture(),
                child: Text('Change Profile Picture'),
              ),
              Divider(indent: 20, endIndent: 20),
              SizedBox(height: DSizes.spaceBtwItems),
              headlineTitle(title: 'Profile Information', showMoreItem: false),
              SizedBox(height: DSizes.spaceBtwItems),
              Obx(
                () => DmenuProfile(
                  title: userController.user.value.fullName ?? '',
                  subject: 'Name',
                  onpressed: () {
                    Get.to(UpdateName());
                  },
                ),
              ),
              DmenuProfile(
                title: userController.user.value.username ?? '',
                subject: 'Username',
                onpressed: () {},
              ),
              SizedBox(height: DSizes.spaceBtwItems),

              Divider(indent: 20, endIndent: 20),
              SizedBox(height: DSizes.spaceBtwItems),

              headlineTitle(title: 'Personal Information', showMoreItem: false),
              DmenuProfile(
                title: userController.user.value.id ?? '',
                subject: 'User ID',
                onpressed: () {},
                icon: Iconsax.copy,
              ),
              DmenuProfile(
                title: userController.user.value.email ?? '',
                subject: 'E-mail',
                onpressed: () {},
              ),
              DmenuProfile(
                title: userController.user.value.phone ?? '',
                subject: 'Phone Number',
                onpressed: () {},
              ),
              DmenuProfile(title: 'Male', subject: 'Gender', onpressed: () {}),
              DmenuProfile(
                subject: 'Date of Birth',
                title: '14 Dec, 2001',
                onpressed: () {},
              ),

              Divider(indent: 20, endIndent: 20),
              TextButton(
                onPressed: userController.deleteAccountWarningPop,
                child: Text(
                  'Close Account',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

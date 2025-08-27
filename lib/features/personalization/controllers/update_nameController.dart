import 'package:ecommerce/common/widgets/full_screen_loader.dart';
import 'package:ecommerce/controllers/Network/networkController.dart';
import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/utils/constant/image_strings.dart';
import 'package:ecommerce/utils/loaders/Loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final Usercontroller = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void onInit() {
    initalizeName();
    super.onInit();
  }

  Future<void> initalizeName() async {
    firstname.text = Usercontroller.user.value.firstName!;
    lastname.text = Usercontroller.user.value.lastName!;
  }

  Future<void> UpdateUsername() async {
    try {
      DFullScreenLoader.openLoadingDialoge(
        'We are Updting your information',
        DImages.decorAnimation,
      );
      final isConnected = await NetworkManger.instance.isConnected();
      if (!isConnected) {
        DFullScreenLoader.stopLoading();
        return;
      }
      if (!formkey.currentState!.validate()) {
        DFullScreenLoader.stopLoading();
        return;
      }
      Map<String, dynamic> name = {
        "first_name": firstname.text.trim(),
        "last_name": lastname.text.trim(),
      };
      await userRepository.updateSingleField(name);

      Usercontroller.user.value.firstName = firstname.text
          .trim(); // Update the first name in the user object
      Usercontroller.user.value.lastName = lastname.text
          .trim(); // Update the last name in the user object

      DFullScreenLoader.stopLoading();
      Usercontroller.user.refresh();

      DLoaders.success("Success", "Your Name has been Updated");
    } catch (e) {
      DLoaders.error('Data Not Update', e.toString());
    }
  }
}

import 'package:ecommerce/controllers/Network/networkController.dart';
import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:get/get.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManger());
    Get.put(UserRepository());
  }
}

import 'package:ecommerce/data/repositories/banner/banner_repostiry.dart';
import 'package:ecommerce/features/personalization/models/bannerModel.dart';
import 'package:ecommerce/utils/loaders/Loaders.dart';
import 'package:get/get.dart';

class DBannarController extends GetxController {
  static DBannarController get instance => Get.find();
  final isLoading = false.obs;
  final carsoulCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();

    super.onInit();
  }

  void changeIndex(int index) {
    carsoulCurrentIndex.value = index;
  }

  // Fetch Banners
  Future<void> fetchBanners() async {
    isLoading.value = true;
    try {
      final bannerRepo = Get.put(BannerRepostiry());
      final baners = await bannerRepo.fetchBanners();
      banners.assignAll(baners);
    } catch (e) {
      DLoaders.error('oh snap..', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

import 'package:ecommerce/data/repositories/categories/category_repository.dart';
import 'package:ecommerce/features/personalization/models/categoryModel.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<Categorymodel> allcategories = <Categorymodel>[].obs;
  RxList<Categorymodel> futuaredcategories = <Categorymodel>[].obs;

  @override
  onInit() async {
    super.onInit();
    await FetchCategories();
  }

  // -- Load Cateory  data
  Future<void> FetchCategories() async {
    isLoading.value = true;
    try {
      final categories = await _categoryRepository.getAllCategories();
      allcategories.assignAll(categories);

      futuaredcategories.assignAll(
        allcategories
            .where(
              (category) => category.isFutared && category.parentId.isEmpty,
            )
            .take(8)
            .toList(),
      );
      isLoading.value = false;
    } catch (e) {
      print('Error loading categories: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

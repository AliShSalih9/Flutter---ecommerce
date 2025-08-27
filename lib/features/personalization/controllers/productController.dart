import 'package:ecommerce/data/repositories/product/product_repository.dart';
import 'package:ecommerce/features/personalization/models/productModel.dart';
import 'package:ecommerce/utils/constant/enum.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  // Observable list of products
  RxList<ProductModel> products = <ProductModel>[].obs;

  // Repository instance
  final productRepository = Get.put(ProductRepository());

  // Loading state
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFeaturedProducts();
  }

  /// Fetch featured products from the repository
  Future<void> fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      // Optionally clear old products if refreshing
      // products.clear();

      final fetchedProducts = await productRepository.getFuaturedProducts();

      // Add fetched products to the observable list
      products.addAll(fetchedProducts);
    } catch (e) {
      // Handle errors (optional: show snackbar or log)
      print("Error fetching featured products: $e");
    } finally {
      // Always reset loading state
      isLoading.value = false;
    }
  }

  String? getProductPrice(ProductModel? product) {
    double smallasPrice = double.infinity;
    double largestPrice = 0.0;
    if (product?.productType == productType.Single.toString()) {
      return (product!.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      for (var vartition in product!.variations) {
        double priceToConsider = vartition.salePrice > 0.0
            ? vartition.salePrice
            : vartition.price;
        if (priceToConsider < smallasPrice) {
          smallasPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
        if (smallasPrice.isEqual(largestPrice)) {
          return largestPrice.toString();
        }
        return "$smallasPrice-$largestPrice";
      }
    }
    return null;
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;

    // Ensure percentage is not negative
    if (percentage <= 0) return null;

    return percentage.toStringAsFixed(0); // returns like "20"
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? "In Stock" : "Out Of Stock";
  }
}

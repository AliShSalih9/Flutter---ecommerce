import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/personalization/models/productModel.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  getFuaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where("IsFeatured", isEqualTo: true)
          .get();

      return snapshot.docs.map((doc) => ProductModel.fromJson(doc)).toList();
    } catch (s) {
      throw s.toString();
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/authentication/controllers/dfirebasestorgeservices.dart';
import 'package:ecommerce/features/personalization/models/categoryModel.dart';
import 'package:ecommerce/utils/exceptions/format_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Get all categories from firestore database
  Future<List<Categorymodel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final data = snapshot.docs
          .map((doc) => Categorymodel.fromJson(doc))
          .toList();
      return data;
    } on FirebaseException catch (e) {
      throw TFormatException(e.code).message;
    } on PlatformException catch (e) {
      throw TFormatException(e.code).message;
    }
  }

  Future<void> uploadDummyData(List<Categorymodel> categories) async {
    try {
      final storge = Get.put(DFirebaseStorgeServices());
      for (var category in categories) {
        final file = await storge.getImageDataFromAssets(category.image);
        final url=await storge.uploadImageData('categories',file,category.name);
        category.image=url;
        await _db.collection('Categories').add(category.toJson());
        

      }
    } on FirebaseException catch (e) {
      throw TFormatException(e.code).message;
    } on PlatformException catch (e) {
      throw TFormatException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }
}

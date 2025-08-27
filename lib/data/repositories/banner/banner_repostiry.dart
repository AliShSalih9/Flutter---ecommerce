import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/personalization/models/bannerModel.dart';
import 'package:ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepostiry extends GetxController {
  static BannerRepostiry get instance => Get.find();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('active', isEqualTo: true)
          .get();
      return result.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e, s) {
      print('error $s');
      rethrow;
    }
  }
}

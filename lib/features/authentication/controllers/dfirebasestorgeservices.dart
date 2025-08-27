import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DFirebaseStorgeServices extends GetxController {
  static DFirebaseStorgeServices get instance => Get.find();
  final _storge = FirebaseStorage.instance;
  // Upload local assets from IDE

  // return a Unit8List containing the image data
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      );
      return imageData;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> uploadImageData(
    String path,
    Uint8List imageData,
    String name,
  ) async {
    try {
      final ref = _storge.ref().child(path).child(name);
      await ref.putData(imageData);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> uploadImageFile(String path, XFile imageData) async {
    try {
      final ref = _storge.ref().child(path).child(imageData.name);
      await ref.putFile(File(imageData.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Upload Cateogries to the Cloud fire
}

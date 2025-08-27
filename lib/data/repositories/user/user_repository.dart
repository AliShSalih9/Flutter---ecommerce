import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/repositories/auth/authentication_repository.dart';
import 'package:ecommerce/features/personalization/models/User_model.dart';
import 'package:ecommerce/utils/exceptions/format_exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

/// Repository class for user-related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to fetch user details based on user ID.
  Future<UserModel> fetchUserDetails(String userId) async {
    final documentSnapshot = await _db
        .collection("Users")
        .doc(userId) // ✅ use the parameter
        .get();

    if (documentSnapshot.exists) {
      return UserModel.fromSnapshot(documentSnapshot);
    } else {
      return UserModel.empty();
    }
  }

  /// Function to update user data in Firestore.
  Future<void> updateUserDetails(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).update(user.toJson());
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to update any field in specific Users Collection.
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    final userId = AuthenticationRepository.instance.currentUser!.uid;
    await _db.collection("Users").doc(userId).update(json);
  }

  /// Function to remove user data from Firestore.
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TFormatException.fromCode(e.code).message;
    } catch (e) {
      throw Exception(e);
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/common/widgets/full_screen_loader.dart';
import 'package:ecommerce/controllers/Network/networkController.dart';
import 'package:ecommerce/data/repositories/auth/authentication_repository.dart';
import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/features/personalization/models/User_model.dart';
import 'package:ecommerce/screens/re_atuhloginform.dart';
import 'package:ecommerce/screens/register/login.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/image_strings.dart';
import 'package:ecommerce/utils/loaders/Loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final UserRepository userRepository = Get.put(UserRepository());

  Rx<UserModel> user = UserModel.empty().obs;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  onInit() {
    // Load user details if already logged in

    super.onInit();
    _auth.authStateChanges().listen((FirebaseUser) {
      if (_auth.currentUser == null) {
        user.value = UserModel.empty(); // Reset user when signed out
      } else {
        fetchUserRecord();
      }
    });
  }

  // save user record from any registration
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    await fetchUserRecord();
    if (userCredential != null) {
      final displayName = userCredential.user?.displayName ?? '';
      final nameParts = UserModel.nameParts(displayName);
      final username = UserModel.generatedUsername(displayName);

      final user = UserModel(
        id: userCredential.user?.uid ?? '',
        email: userCredential.user?.email,
        firstName: nameParts.isNotEmpty ? nameParts[0] : '',
        lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
        username: username,
        phone: userCredential.user?.phoneNumber,
        imagePath: userCredential.user?.photoURL,
      );

      await userRepository.saveUserRecord(user);
    }
  }

  Future<void> fetchUserRecord() async {
    try {
      final userId = AuthenticationRepository.instance.currentUser?.uid;

      if (userId != null) {
        // Fetch user data from Firestore
        final userData = await userRepository.fetchUserDetails(userId);

        // Update the Rx<UserModel>
        user.value = userData;
      } else {
        // No logged-in user
        user.value = UserModel.empty();
        debugPrint("⚠️ User not logged in");
      }
    } catch (e) {
      // On error, reset user to empty
      user.value = UserModel.empty();
      debugPrint("Error fetching user record: $e");
    }
  }

  Future<void> updateUserDetails(UserModel user) async {
    try {
      await userRepository.updateUserDetails(user);
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      final userId = AuthenticationRepository.instance.currentUser?.uid;
      if (userId != null) {
        await userRepository.updateSingleField(json);
      } else {
        throw 'User not logged in';
      }
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> deleteAccountWarningPop() async {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(DSizes.md),
      title: 'Delete Account',
      middleText: """
Are you sure you want to delete your account? This action cannot be undone.
""",
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.red),
        ),
        onPressed: deleteUserAccount,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: DSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () {
          Navigator.of(Get.overlayContext!).pop();
        },
        child: Text('Cancel'),
      ),
    );
  }

  /// Delete User Account
  Future<void> deleteUserAccount() async {
    try {
      DFullScreenLoader.openLoadingDialoge(
        'Processing...',
        DImages.decorAnimation,
      );
      final auth = AuthenticationRepository.instance;
      final provider = auth.currentUser?.providerData
          .map((e) => e.providerId)
          .first;
      if (provider!.isNotEmpty) {
        // re verify auth Email
        if (provider == "google.com") {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          DFullScreenLoader.stopLoading();
          Get.offAll(LoginScreen());
        } else if (provider == "password") {
          DFullScreenLoader.stopLoading();
          Get.to(ReAtuhloginform());
        }
      }
      // ignore: empty_catches
    } catch (error) {}
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    DFullScreenLoader.openLoadingDialoge(
      'Processing...',
      DImages.decorAnimation,
    );
    final isconected = await NetworkManger.instance.isConnected();
    if (!isconected) {
      DFullScreenLoader.stopLoading();
      return;
    }
    if (!formkey.currentState!.validate()) {
      DFullScreenLoader.stopLoading();
    }
    await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(
      email.text.trim(),
      password.text.trim(),
    );
    await AuthenticationRepository.instance.deleteAccount();
    await AuthenticationRepository.instance.logout();
    DFullScreenLoader.stopLoading();
    Get.offAll(LoginScreen());
  }

  UploadUserProfilePicture() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (image != null) {
      // Await the upload to get the actual URL
      final imageUrl = await userRepository.uploadImage(
        'Users/Images/Profile/',
        image,
      );

      // Update Firestore
      Map<String, dynamic> json = {'image_path': imageUrl};
      await userRepository.updateSingleField(json);

      // Update the local reactive user model
      user.value.imagePath = imageUrl;
      user.refresh(); // <-- Make sure Obx reacts

      DLoaders.success(
        'Congratulations',
        'Your Profile Image has been Updated!',
      );
    }
  }
}

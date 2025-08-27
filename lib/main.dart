import 'package:ecommerce/app.dart';
import 'package:ecommerce/data/repositories/auth/authentication_repository.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  // Add Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();
  // init local Storge
  await GetStorage.init();
  // Ensure onboarding is false on first run

  // Await Native Splash
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );
  // Initalize Firebase
  // done: Initalize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));

   //Todo: Initalize GetIt

  // Check if onboarding was completed
  runApp(const App());
}

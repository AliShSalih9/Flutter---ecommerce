import 'package:ecommerce/bindings/general_binding.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      themeMode: ThemeMode.system,
      theme: DAppTheme.lightTheme,
      initialBinding: GeneralBinding(),
      darkTheme: DAppTheme.darkTheme,
      home: Scaffold(
        backgroundColor: DColors.primaryColor,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }
}

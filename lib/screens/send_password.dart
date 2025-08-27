import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/screens/register/login.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendPasswordScreen extends StatelessWidget {
  const SendPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Get.offAll(() => LoginScreen());
            },
          ),
        ],
      ),
      body:SingleChildScrollView(
        child: Padding(padding: EdgeInsetsGeometry.all(
          DSizes.defaultSpacing,
        ),
        child: Column(
          children: [
            
          ],
        ),
        
        ),
      )
    );
  }
}

import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/screens/account/address/add_address.dart';
import 'package:ecommerce/screens/account/address/widgets/address_list.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:ecommerce/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(showBackArrow: true, title: Text('Addresses')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddAddress());
        },
        backgroundColor: DColors.primaryColor,
        child: Icon(Iconsax.add, color: DColors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpacing),
          child: ListView.separated(
            separatorBuilder: (context, index) =>
                SizedBox(height: DSizes.spaceBtwItems),
            shrinkWrap: true,
            itemCount: 10,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return addressList();
            },
          ),
        ),
      ),
    );
  }
}

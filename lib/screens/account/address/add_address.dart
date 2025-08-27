import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(showBackArrow: true, title: Text('Add New Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpacing),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Name',
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
              SizedBox(height: DSizes.spaceBtwInputFields),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  prefixIcon: Icon(Iconsax.mobile),
                ),
              ),
              SizedBox(height: DSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Street',
                        prefixIcon: Icon(Iconsax.location),
                      ),
                    ),
                  ),
                  SizedBox(width: DSizes.sm),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Postal Code',
                        prefixIcon: Icon(Iconsax.code),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: DSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'City',
                        prefixIcon: Icon(Iconsax.buliding),
                      ),
                    ),
                  ),
                  SizedBox(width: DSizes.sm),
                ],
              ),
              SizedBox(height: DSizes.spaceBtwInputFields),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, DSizes.buttonHeight),
                ),
                onPressed: () {},
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ecommerce/common/brands/brand_card.dart';
import 'package:ecommerce/common/widgets/TabBar/tabBar.dart';
import 'package:ecommerce/common/widgets/custome_appbar.dart';
import 'package:ecommerce/common/widgets/headline_title.dart';
import 'package:ecommerce/common/widgets/search_bar.dart';
import 'package:ecommerce/features/personalization/controllers/cateogries/category.dart';
import 'package:ecommerce/screens/brand/brand_screen.dart';
import 'package:ecommerce/screens/home/widgets/grid_widget.dart';
import 'package:ecommerce/screens/store/widgets/brand_mark.dart';
import 'package:ecommerce/utils/constant/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.futuaredcategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: DAppBar(
          title: Text('Store'),
          actions: [
            Stack(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Iconsax.shopping_bag)),
                Positioned(
                  top: 3,
                  right: 3,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),

                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(fontSize: 8, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 440,
                automaticallyImplyLeading: false,
                flexibleSpace: Padding(
                  padding: EdgeInsetsGeometry.all(DSizes.defaultSpacing),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      //  -- Search bar
                      SizedBox(height: DSizes.spaceBtwItems),
                      DContinarSearch(title: 'Search in Store'),
                      SizedBox(height: DSizes.spaceBtwSections),
                      headlineTitle(
                        title: 'Fuatured Brands',
                        onpressed: () {
                          Get.to(BrandScreen());
                        },
                      ),
                      SizedBox(height: DSizes.spaceBtwItems / 2),
                      GridWidget(
                        mainAxisExtent: 80,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return DBrandCard(
                            brandName: 'Puma',
                            imageUrl:
                                'https://1000logos.net/wp-content/uploads/2017/05/PUMA-Logo-1978-1980-500x281.png',
                            productCount: 299,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                bottom: DTabBar(
                  tabs: categories
                      .map((category) => Text(category.name))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            clipBehavior: Clip.none,

            children: [
              BrandMark(),
              BrandMark(),
              Container(),
              Container(),

              Container(),
            ],
          ),
        ),
      ),
    );
  }
}

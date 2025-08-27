import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/screens/account/profile_screen.dart';
import 'package:ecommerce/screens/brand/brand_screen.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/onBoarding_screen.dart';
import 'package:ecommerce/screens/orders/orders_screen.dart';
import 'package:ecommerce/screens/orders/widgets/order_card.dart';
import 'package:ecommerce/screens/page%20view/reviw_rating.dart';
import 'package:ecommerce/screens/register/login.dart';
import 'package:ecommerce/screens/register/signUp.dart';
import 'package:ecommerce/screens/store/store_screen.dart';
import 'package:ecommerce/screens/wishlist/wishlist_screen.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: DRoutes.home, page: () => HomeScreen()),
    GetPage(name: DRoutes.store, page: () => StoreScreen()),
    GetPage(name: DRoutes.favourites, page: () => WishlistScreen()),
    GetPage(name: DRoutes.Settings, page: () => ProfileScreen()),
    GetPage(name: DRoutes.productReview, page: () => ReviwRatingPage()),
    GetPage(name: DRoutes.order, page: () => OrdersScreen()),
    GetPage(
      name: DRoutes.checkout,
      page: () =>
          order_card(dark: DHelperFunction.isDarkMode(Get.overlayContext!)),
    ),
    GetPage(name: DRoutes.brand, page: () => BrandScreen()),
    GetPage(name: DRoutes.onBoarding, page: () => OnboardingScreen()),
    GetPage(name: DRoutes.login, page: () => LoginScreen()),
    GetPage(name: DRoutes.signUp, page: () => SignUpScreen()),
  ];
}

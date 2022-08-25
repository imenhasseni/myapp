
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:myapp/app/modules/home/bindings/home_binding.dart';
import 'package:myapp/app/modules/home/views/home_page.dart';
import 'package:myapp/app/modules/login/bindings/login_binding.dart';
import 'package:myapp/app/modules/login/views/login_page.dart';
import 'package:myapp/app/modules/onbording/views/onbording_page.dart';
import 'package:myapp/app/modules/product/bindings/product_blinding.dart';
import 'package:myapp/app/modules/product/views/details_product.dart';
import 'package:myapp/app/modules/product/views/product_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBORDING;

  static final routes = [
    GetPage(
      name: _Paths.ONBORDING,
      page: () => OnbordingPage(),

    ),
     GetPage(
       name: _Paths.LOGIN,
       page: () => LoginPage(),
       binding: LoginBinding(),
     ),
     GetPage(
       name: _Paths.HOME,
       page: () => HomePage(),
       binding: HomeBinding(),
     ),
       GetPage(
       name: _Paths.PRODUCT,
       page: () => ProductPage(),
       binding: ProductBinding(),
     ),
         GetPage(
       name: _Paths.DETAILSPRODUCT,
       page: () => DetailPage(),
     ),

  ];
}
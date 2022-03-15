import 'package:get/get.dart';

import 'package:nzz/pages/Index/index.dart';
import 'package:nzz/pages/Index/pages/foodPage/food_page_view.dart';
import 'package:nzz/pages/Category/category.dart';
import 'package:nzz/pages/Message/message.dart';
import 'package:nzz/pages/Shopcar/shopcar.dart';
import 'package:nzz/pages/Mine/mine.dart';
import 'package:nzz/pages/navBar/bindings/nav_bar_binding.dart';
import 'package:nzz/pages/navBar/views/nav_bar_view.dart';

class AppPages {
  AppPages._();

  static const initialPage = '/food_page_view';

  static final routes = [
    GetPage(name: '/index', page: () => Index()),
    GetPage(name: '/food_page_view', page: () => FoodPageView()), //美食主页
    GetPage(name: '/category', page: () => CateGory()),
    GetPage(name: '/message', page: () => Message()),
    GetPage(name: '/shopcar', page: () => ShopCar()),
    GetPage(name: '/mine', page: () => Mine()),
    GetPage(
      name: '/nav_bar',
      page: () => NavBarView(),
      binding: NavBarBinding(),
    )
  ];
}

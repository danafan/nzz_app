import 'package:get/get.dart';

import 'package:nzz/pages/Category/category.dart';
import 'package:nzz/pages/Index/index.dart';
import 'package:nzz/pages/Message/message.dart';
import 'package:nzz/pages/Mine/mine.dart';
import 'package:nzz/pages/Shopcar/shopcar.dart';
import 'package:nzz/pages/navBar/bindings/nav_bar_binding.dart';
import 'package:nzz/pages/navBar/views/nav_bar_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NAV_BAR;

  static final routes = [
    GetPage(name: _Paths.INDEX, page: () => Index()),
    GetPage(name: _Paths.CATEGORY, page: () => CateGory()),
    GetPage(name: _Paths.MESSAGE, page: () => Message()),
    GetPage(name: _Paths.SHOPCAR, page: () => ShopCar()),
    GetPage(name: _Paths.MINE, page: () => Mine()),
    GetPage(
      name: _Paths.NAV_BAR,
      page: () => NavBarView(),
      binding: NavBarBinding(),
    )
  ];
}

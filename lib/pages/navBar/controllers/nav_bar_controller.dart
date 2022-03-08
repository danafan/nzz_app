import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nzz/pages/Index/index.dart';
import 'package:nzz/pages/Category/category.dart';
import 'package:nzz/pages/Message/message.dart';
import 'package:nzz/pages/Shopcar/shopcar.dart';
import 'package:nzz/pages/Mine/mine.dart';

class NavBarController extends GetxController {

  //当前选中的tab下标
  var currentPageIndex = 0.obs;

  // 页面数组
  List<Widget> pageList = [Index(), CateGory(), Message(), ShopCar(), Mine()];

  //按钮数组
  List<BottomNavigationBarItem> buttonList = [
    BottomNavigationBarItem(icon: Icon(Icons.architecture_sharp), label: '首页'),
    BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: '分类'),
    BottomNavigationBarItem(icon: Icon(Icons.cake_rounded), label: '消息'),
    BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: '购物车'),
    BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: '我的')
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  //切换tab
  void checkPageIndex(i) => currentPageIndex.value = i;
}

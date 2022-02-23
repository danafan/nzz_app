import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:nzz/app/pages/navBar/controllers/nav_bar_controller.dart';
import 'package:nzz/basic.dart';

class NavBarView extends GetView<NavBarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: controller.currentPageIndex.toInt(),
        children: controller.pageList,
      )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
          currentIndex: controller.currentPageIndex.toInt(),
          onTap: (index) {
            controller.checkPageIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor:Colors.white,
          fixedColor: ColorStyle.colorPrimary,
          items: controller.buttonList)),
    );
  }
}

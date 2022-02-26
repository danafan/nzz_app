import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nzz/app/controllers/index_controller.dart';

class ScrollBarController extends GetxController {
  
  //当前选中下标
  RxInt currentIndex = 0.obs;

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

  //切换当前选中下标
  void changeCurrentIndex(i,id){
    currentIndex.value = i;
    //首页数据Controller
    final IndexController indexController = Get.find<IndexController>();
    indexController.changeScroll(id);
  }


}

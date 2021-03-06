import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ScrollCateController extends GetxController {
  // 自定义滚动条实际当前滚动位置
  RxDouble actualPixels = (1.0*-1).obs;

  bool handleScrollNotification(ScrollNotification notification) {
    final ScrollMetrics metrics = notification.metrics;
    // 滚动组件最大滚动距离
    double maxScrollExtent = metrics.maxScrollExtent;
    // 当前滚动位置
    double pixels = metrics.pixels;
    //自定义滚动条当前滚动位置
    double customPixels = pixels * 36.r / maxScrollExtent;
    //自定义滚动条实际当前滚动位置
    actualPixels.value = -1 + customPixels * 2/36.r;
    return true;
  }

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
}

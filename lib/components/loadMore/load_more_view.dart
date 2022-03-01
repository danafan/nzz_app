import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nzz/components/loadMore/load_more_controller.dart';

class LoadMoreView extends StatelessWidget {
  //列表底部加载组件controller
  final LoadMoreController loadMoreController = Get.put(LoadMoreController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Container(
      alignment: Alignment.center,
      height: 60.r,
      child: loadMoreController.isLoad == true
          ? Text('----- 加载中 ------')
          : Text('----- 我是有底线的 ------'),
    ));
  }
}

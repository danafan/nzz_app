import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nzz/basic.dart';
import 'package:nzz/controllers/category_controller.dart';

class CateGoodsList extends StatelessWidget {

  //分类controller
  final CategoryController categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: Obx(() => ListView.builder(
              primary:false,
              itemExtent: 220.r, //指定子组件的高度，如果指定了效率更高，不用每次都去计算子组件的高度了
              itemCount: categoryController.goodsList.length, //商品的个数
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height:220.r,
                  decoration: BoxDecoration(border:Border.all()),
                );
              },
            )));
  }
}
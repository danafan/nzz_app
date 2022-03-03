import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nzz/basic.dart';
import 'package:nzz/controllers/category_controller.dart';

class LeftCategoryView extends StatelessWidget {

  //分类controller
  final CategoryController categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorStyle.colorBackDarkGround,
        width: 164.r,
        child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: Obx(() => ListView.builder(
              primary:false,
              itemExtent: 100.r, //指定子组件的高度，如果指定了效率更高，不用每次都去计算子组件的高度了
              itemCount: categoryController.leftCateList.length, //子组件的个数
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Obx(() => Container(
                    color: categoryController.leftCurrentIndex.value == index
                        ? ColorStyle.colorWhite
                        : ColorStyle.colorBackDarkGround,
                    padding: EdgeInsets.symmetric(horizontal: 12.r),
                    alignment: Alignment.center,
                    child: Text(categoryController.leftCateList[index].cateName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: categoryController.leftCurrentIndex.value ==
                                    index
                                ? ColorStyle.colorPrimary
                                : ColorStyle.colorTitle,
                            fontSize:
                                categoryController.leftCurrentIndex.value ==
                                        index
                                    ? 32.r
                                    : 28.r,
                            fontWeight:
                                categoryController.leftCurrentIndex.value ==
                                        index
                                    ? FontWeight.w600
                                    : FontWeight.w400)),
                  )),
                   onTap: () {
                    // 切换左侧分类选中
                    categoryController.changeLeftCurrentIndex(index);
                  }
                );
              },
            ))));
  }
}

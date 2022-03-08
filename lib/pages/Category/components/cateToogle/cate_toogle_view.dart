import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nzz/basic.dart';
import 'package:nzz/controllers/category_controller.dart';

class CateToogleView extends StatelessWidget {
  //分类controller
  final CategoryController categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.only(left: 30.r),
          height: 90.r,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Obx(() => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: categoryController.childCateController,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Obx(() => Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                    left: index == 0 ? 0 : 10.r, right: 10.r),
                                child:
                                    Text(categoryController.rightCateList[index].cateName,
                                        style: TextStyle(
                                            color:
                                                categoryController
                                                            .rightCurrentIndex
                                                            .value ==
                                                        index
                                                    ? ColorStyle.colorPrimary
                                                    : Color(0xff666666),
                                            fontSize: categoryController
                                                        .rightCurrentIndex
                                                        .value ==
                                                    index
                                                ? 28.r
                                                : 24.r,
                                            fontWeight: categoryController
                                                        .rightCurrentIndex
                                                        .value ==
                                                    index
                                                ? FontWeight.w600
                                                : FontWeight.w400)))),
                            onTap: () {
                              categoryController.changeRightCurrentIndex(index);
                            },
                          );
                        },
                        itemCount: categoryController.rightCateList.length,
                      ))),
              GestureDetector(
                  onTap: () {
                    categoryController.changeOpenStatus(1);
                  },
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Color(0xffd3d3d3),
                          offset: Offset.infinite,
                          blurRadius: 10.0,
                          spreadRadius: 0.5)
                    ]),
                    width: 90.r,
                    height: 90.r,
                    alignment: Alignment.center,
                    child: Image.asset('images/cate_scroll_icon.png',
                        width: 48.r, height: 48.r),
                  ))
            ],
          ),
        );
  }
}

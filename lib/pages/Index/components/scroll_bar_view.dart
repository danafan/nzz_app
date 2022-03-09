import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nzz/controllers/index_controller.dart';
import 'package:nzz/basic.dart';

class ScrollBarView extends StatelessWidget {
  //首页数据Controller
  final IndexController indexController = Get.find<IndexController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: EdgeInsets.only(left: 30.r),
          color: ColorStyle.colorBackGround,
          height: 150.r,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: <Widget>[
                  Offstage(
                    offstage: index == 0,
                    child: Container(
                        width: 1.r, height: 40.r, color: Color(0xffe1e1e1)),
                  ),
                  GestureDetector(
                    child: Obx(
                      () => Container(
                          height: 150.r,
                          padding: EdgeInsets.only(
                              left: index == 0 ? 10.r : 40.r, right: 40.r),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(indexController.scrollList[index].cateName,
                                  style: TextStyle(
                                      color: indexController
                                                  .currentIndex.value ==
                                              index
                                          ? ColorStyle.colorPrimary
                                          : ColorStyle.colorText,
                                      fontWeight: indexController
                                                  .currentIndex.value ==
                                              index
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                      fontSize: indexController
                                                  .currentIndex.value ==
                                              index
                                          ? 42.r
                                          : 32.r)),
                              SizedBox(height: 3.r),
                              indexController.currentIndex.value == index
                                  ? Container(
                                      alignment: Alignment.center,
                                      height: 30.r,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.r),
                                      decoration: BoxDecoration(
                                          color: ColorStyle.colorPrimary,
                                          borderRadius:
                                              BorderRadius.circular(15.r)),
                                      child: Text(
                                          indexController
                                              .scrollList[index].activityName,
                                          style: TextStyle(
                                              color: ColorStyle.colorWhite,
                                              fontSize: 20.r)))
                                  : Text(
                                      indexController
                                          .scrollList[index].activityName,
                                      style: TextStyle(
                                          color: ColorStyle.colorText,
                                          fontSize: 20.r)),
                            ],
                          )),
                    ),
                    onTap: () {
                      indexController.changeCurrentIndex(
                          index);
                    },
                  )
                ],
              );
            },
            itemCount: indexController.scrollList.length,
          ),
        ));
  }
}

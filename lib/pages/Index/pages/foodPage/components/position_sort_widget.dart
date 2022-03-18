import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nzz/basic.dart';
import 'package:nzz/pages/Index/pages/foodPage/food_page_controller.dart';

class PositionSortWidget extends StatelessWidget {
  //同城美食controller
  final FoodPageController foodPageController = Get.find<FoodPageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        key: foodPageController.anchorKey,
        height: 68.r,
        color: ColorStyle.colorBackGround,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //美食类型
            GestureDetector(
                onTap: () {
                  foodPageController.openSortModel(1);
                },
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Obx(() => Text(
                            foodPageController.foodTypeList.isNotEmpty
                                ? foodPageController
                                    .foodTypeList[foodPageController
                                        .checkFoodTypeIndex
                                        .toInt()]
                                    .value
                                : '',
                            style: TextStyle(
                                color: foodPageController
                                            .checkFoodTypeIndex.value >
                                        0
                                    ? ColorStyle.colorPrimary
                                    : ColorStyle.colorTitle,
                                fontWeight: foodPageController
                                            .checkFoodTypeIndex.value >
                                        0
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                fontSize: 24.r),
                          )),
                      SizedBox(width: 6.r),
                      Obx(() => Image.asset(
                            foodPageController.foodSortIcon.value,
                            width: 13.53.r,
                            height: 11.87.r,
                          ))
                    ],
                  ),
                )),
            //智能排序
            GestureDetector(
                onTap: () {
                  foodPageController.openSortModel(2);
                },
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Obx(() => Text(
                           foodPageController
                                    .sortList[foodPageController
                                        .sortCurrentIndex
                                        .toInt()]['title']
                                    ,
                            style: TextStyle(
                                color: foodPageController
                                            .sortCurrentIndex.value >
                                        0
                                    ? ColorStyle.colorPrimary
                                    : ColorStyle.colorTitle,
                                fontWeight: foodPageController
                                            .sortCurrentIndex.value >
                                        0
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                fontSize: 24.r),
                          )),
                      SizedBox(width: 6.r),
                      Obx(() => Image.asset(
                            foodPageController.sortCurrentIcon.value,
                            width: 13.53.r,
                            height: 11.87.r,
                          ))
                    ],
                  ),
                )),
            //筛选
            GestureDetector(
                onTap: () {
                  foodPageController.openSortModel(3);
                },
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '筛选',
                        style: TextStyle(
                            color: ColorStyle.colorTitle, fontSize: 24.r),
                      ),
                      SizedBox(width: 6.r),
                      Image.asset(
                        'images/food_sort_down.png',
                        width: 13.53.r,
                        height: 11.87.r,
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}

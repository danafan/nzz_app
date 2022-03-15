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
            GestureDetector(
                onTap: () {
                  if(foodPageController.dy > foodPageController.scrollTop){
                     foodPageController.listController.jumpTo(foodPageController.dy);
                  }
                },
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '美食类型',
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
                )),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '智能排序',
                    style:
                        TextStyle(color: ColorStyle.colorTitle, fontSize: 24.r),
                  ),
                  SizedBox(width: 6.r),
                  Image.asset(
                    'images/food_sort_down.png',
                    width: 13.53.r,
                    height: 11.87.r,
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '筛选',
                    style:
                        TextStyle(color: ColorStyle.colorTitle, fontSize: 24.r),
                  ),
                  SizedBox(width: 6.r),
                  Image.asset(
                    'images/food_sort_down.png',
                    width: 13.53.r,
                    height: 11.87.r,
                  )
                ],
              ),
            )
          ],
        ));
  }
}

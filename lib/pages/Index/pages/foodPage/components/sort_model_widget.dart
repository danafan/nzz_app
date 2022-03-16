import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nzz/basic.dart';
import 'package:nzz/pages/Index/pages/foodPage/food_page_controller.dart';

class SortModelWidget extends StatelessWidget {
  //同城美食controller
  final FoodPageController foodPageController = Get.find<FoodPageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 68.r),
      width: Get.width,
      height: foodPageController.modelHeight.value,
      color: Colors.black26,
      child: Column(
        children: <Widget>[
          Container(
            height: 860.r,
            padding: EdgeInsets.fromLTRB(40.r, 15.r, 40.r, 5.r),
            color: ColorStyle.colorWhite,
            child: Obx(() => MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: foodPageController.foodTypeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        foodPageController.checkFoodType(index);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.r),
                        padding: EdgeInsets.symmetric(vertical: 15.r),
                        child: Obx(() => Text(
                            foodPageController.foodTypeList[index].value,
                            style: TextStyle(
                                color: index ==
                                        foodPageController
                                            .checkFoodTypeIndex.value
                                    ? ColorStyle.colorPrimary
                                    : ColorStyle.colorText,
                                fontSize: 28.r))),
                      ),
                    );
                  },
                ))),
          )
        ],
      ),
    );
  }
}

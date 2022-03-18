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
          // 美食类型
          Obx(() => Offstage(
              offstage: foodPageController.currentIndex.value != 1,
              child: Container(
                height: 860.r,
                padding: EdgeInsets.fromLTRB(40.r, 15.r, 40.r, 5.r),
                color: ColorStyle.colorWhite,
                child: MediaQuery.removePadding(
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
                    )),
              ))),
          // 智能排序
          Obx(() => Offstage(
              offstage: foodPageController.currentIndex.value != 2,
              child: Container(
                height: 860.r,
                padding: EdgeInsets.fromLTRB(40.r, 15.r, 40.r, 5.r),
                color: ColorStyle.colorWhite,
                child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                      itemCount: foodPageController.sortList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            foodPageController.checkCurrentSort(index);
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10.r),
                            padding: EdgeInsets.symmetric(vertical: 15.r),
                            child: Obx(() => Text(
                                foodPageController.sortList[index]['title'],
                                style: TextStyle(
                                    color: index ==
                                            foodPageController
                                                .sortCurrentIndex.value
                                        ? ColorStyle.colorPrimary
                                        : ColorStyle.colorText,
                                    fontSize: 28.r))),
                          ),
                        );
                      },
                    )),
              ))),
          // 筛选
          Obx(() => Offstage(
              offstage: foodPageController.currentIndex.value != 3,
              child: Container(
                color: ColorStyle.colorWhite,
                child: Column(
                  children: <Widget>[
                    // 上面筛选部分
                    Container(
                      padding: EdgeInsets.all(30.r),
                      child: Column(children: <Widget>[
                        selectCate(context,'价格',64.r,foodPageController.priceList,foodPageController.currentPriceIndex)
                      ]),
                    ),
                    // 下面按钮
                  ],
                ),
              )))
        ],
      ),
    );
  }
}

//每一块可筛选的部分
Widget selectCate(context,title,heightNum,dataArr,currentIndex) {
  return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title),
          Container(
              height: heightNum,
              child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: GridView.builder(
                    //子Item的个数
                    itemCount: dataArr.length,
                    //子布局构建器
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          width: 160.r,
                          height: 64.r,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color:
                                  index == currentIndex
                                      ? Color(0xfffff2f3)
                                      : Color(0xfffafafa)),
                          child: Text(
                            dataArr[index]['name'],
                            style: TextStyle(
                                color: index ==
                                        currentIndex
                                    ? ColorStyle.colorPrimary
                                    : ColorStyle.colorText,
                                fontWeight: index ==
                                        currentIndex
                                    ? FontWeight.w600
                                    : FontWeight.w400),
                          ));
                    },
                    //子布局排列方式
                    //按照固定列数来排列
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //主方向的Item间隔 竖直方向
                      mainAxisSpacing: 12,
                      //次方向的Item间隔
                      crossAxisSpacing: 12,
                      //子Item 的宽高比
                      childAspectRatio: 2.1,
                      //每行4列
                      crossAxisCount: 4,
                    ),
                  )))
        ],
      ));
}

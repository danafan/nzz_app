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
                        selectCate(context, '价格', 64.r,
                            foodPageController.priceList, 'price'),
                        selectCate(context, '营业时间', 144.r,
                            foodPageController.timeList, 'time'),
                        selectTagCate(
                            context, '设施&特色', 144.r, foodPageController.tagList)
                      ]),
                    ),
                    // 下面按钮
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Color(0xffdddddd)))),
                      child: Row(children: <Widget>[
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            foodPageController.resetScreen();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text('重置',
                                style: TextStyle(
                                    color: ColorStyle.colorText,
                                    fontSize: 28.r)),
                          ),
                        )),
                        Container(
                            height: 90.r, width: 1.r, color: Color(0xffdddddd)),
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  foodPageController.setArrowStatus();
                                  foodPageController.getFoodStoreList();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text('完成',
                                      style: TextStyle(
                                          color: ColorStyle.colorPrimary,
                                          fontSize: 28.r,
                                          fontWeight: FontWeight.w600)),
                                ))),
                      ]),
                    )
                  ],
                ),
              )))
        ],
      ),
    );
  }
}

//筛选（价格、营业时间）
Widget selectCate(context, title, heightNum, dataArr, type) {
  //同城美食controller
  final FoodPageController foodPageController = Get.find<FoodPageController>();
  return Container(
      margin: EdgeInsets.only(bottom: 30.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title),
          SizedBox(height: 20.r),
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
                      return Obx(() => GestureDetector(
                          onTap: () {
                            foodPageController.checkPriceTime(type, index);
                          },
                          child: Container(
                              width: 160.r,
                              height: 64.r,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: index ==
                                          (type == 'price'
                                              ? foodPageController
                                                  .currentPriceIndex.value
                                              : foodPageController
                                                  .currentTimeIndex.value)
                                      ? Color(0xfffff2f3)
                                      : Color(0xfffafafa)),
                              child: Text(
                                dataArr[index]['name'],
                                style: TextStyle(
                                    color: index ==
                                            (type == 'price'
                                                ? foodPageController
                                                    .currentPriceIndex.value
                                                : foodPageController
                                                    .currentTimeIndex.value)
                                        ? ColorStyle.colorPrimary
                                        : ColorStyle.colorText,
                                    fontWeight: index ==
                                            (type == 'price'
                                                ? foodPageController
                                                    .currentPriceIndex.value
                                                : foodPageController
                                                    .currentTimeIndex.value)
                                        ? FontWeight.w600
                                        : FontWeight.w400),
                              ))));
                    },
                    //子布局排列方式
                    //按照固定列数来排列
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //主方向的Item间隔 竖直方向
                      mainAxisSpacing: 16.r,
                      //次方向的Item间隔
                      crossAxisSpacing: 16.r,
                      //子Item 的宽高比
                      childAspectRatio: 2.5,
                      //每行4列
                      crossAxisCount: 4,
                    ),
                  )))
        ],
      ));
}

//筛选(设施&特色)
Widget selectTagCate(context, title, heightNum, dataArr) {
  //同城美食controller
  final FoodPageController foodPageController = Get.find<FoodPageController>();
  return Container(
      margin: EdgeInsets.only(bottom: 30.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title),
          SizedBox(height: 20.r),
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
                      return Obx(() => GestureDetector(
                            onTap: () {
                              foodPageController.checkCurrentTag(index);
                            },
                            child: Container(
                                width: 160.r,
                                height: 64.r,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: foodPageController.currentTagList
                                            .contains(dataArr[index])
                                        ? Color(0xfffff2f3)
                                        : Color(0xfffafafa)),
                                child: Text(
                                  dataArr[index],
                                  style: TextStyle(
                                      color: foodPageController.currentTagList
                                              .contains(dataArr[index])
                                          ? ColorStyle.colorPrimary
                                          : ColorStyle.colorText,
                                      fontWeight: foodPageController
                                              .currentTagList
                                              .contains(dataArr[index])
                                          ? FontWeight.w600
                                          : FontWeight.w400),
                                )),
                          ));
                    },
                    //子布局排列方式
                    //按照固定列数来排列
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //主方向的Item间隔 竖直方向
                      mainAxisSpacing: 16.r,
                      //次方向的Item间隔
                      crossAxisSpacing: 16.r,
                      //子Item 的宽高比
                      childAspectRatio: 2.5,
                      //每行4列
                      crossAxisCount: 4,
                    ),
                  )))
        ],
      ));
}

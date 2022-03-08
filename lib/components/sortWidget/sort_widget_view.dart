import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nzz/basic.dart';
import 'package:nzz/controllers/category_controller.dart';

class SortWidget extends StatelessWidget {
  
  //分类controller
  final CategoryController categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.r,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 20.r),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var item = categoryController.sortList[index];
          return GestureDetector(
              onTap: () {
                categoryController.changeSort(index);
              },
              child: Obx(() => Container(
                  margin: EdgeInsets.only(right: 22.r),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              categoryController.currentSortIndex.value == index
                                  ? ColorStyle.colorPrimary
                                  : ColorStyle.colorBackGround),
                      color: categoryController.currentSortIndex.value == index
                          ? Color(0x19fe3c50)
                          : ColorStyle.colorBackGround,
                      borderRadius: BorderRadius.circular(24.r)),
                  width: 88.r,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${item['name']}',
                        style: TextStyle(
                            color: categoryController.currentSortIndex.value ==
                                    index
                                ? ColorStyle.colorPrimary
                                : ColorStyle.colorText,
                            fontSize: 24.r,
                            fontWeight:
                                categoryController.currentSortIndex.value ==
                                        index
                                    ? FontWeight.w600
                                    : FontWeight.w400),
                      ),
                      Offstage(
                          offstage: item['haveIcon'] == false,
                          child: SizedBox(width: 3.r)),
                      Offstage(
                          offstage: item['haveIcon'] == false,
                          child: Image.asset(
                              categoryController.currentSortIndex.value == index
                                  ? categoryController.sortIcon.value
                                  : 'images/sort_default.png',
                              width: 14.r,
                              height: 21.r))
                    ],
                  ))));
        },
        itemCount: categoryController.sortList.length,
      ),
    );
  }
}

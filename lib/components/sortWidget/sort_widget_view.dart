import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nzz/components/sortWidget/sort_widget_controller.dart';

class SortWidget extends StatelessWidget {
  //排序条件controller
  final SortWidgetController sortWidgetController =
      Get.put(SortWidgetController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.r,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 30.r),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Obx(() => Container(
                margin: EdgeInsets.only(right: 22.r),
                width: 98.r,
                height: 48.r,
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Text('${sortWidgetController.sortList[index]['name']}')
                  ],
                ))),
            onTap: () {},
          );
        },
        itemCount: sortWidgetController.sortList.length,
      ),
    );
  }
}

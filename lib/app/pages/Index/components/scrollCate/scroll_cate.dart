import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nzz/app/pages/Index/components/scrollCate/scroll_cate_controller.dart';
import 'package:nzz/basic.dart';

class ScrollCate extends StatelessWidget {
  List scrollCateList;

  ScrollCate(this.scrollCateList);

  //可滑动分类的controller
  ScrollCateController scrollCateController = Get.put(ScrollCateController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Container(
                height: 155.r,
                child: NotificationListener<ScrollNotification>(
                  onNotification: scrollCateController.handleScrollNotification,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Container(
                          height: 155.r,
                          width: 155.r,
                          alignment: Alignment.center,
                          child: Text('$index'),
                        ),
                      );
                    },
                    itemCount: 7,
                    itemExtent: 155.r,
                  ),
                )),
            Positioned(
                bottom: 20.r,
                child: Container(
                  width: 76.r,
                  height: 5.r,
                  decoration: BoxDecoration(
                      color: Color(0xffc7c7c7),
                      borderRadius: BorderRadius.all(Radius.circular(22.r))),
                  child: Align(
                    alignment: Alignment(scrollCateController.actualPixels, 0),
                    child: Container(
                      width: 36.r,
                      height: 5.r,
                      decoration: BoxDecoration(
                          color: ColorStyle.colorPrimary,
                          borderRadius:
                              BorderRadius.all(Radius.circular(22.r))),
                    ),
                  ),
                ))
          ],
        ));
  }
}

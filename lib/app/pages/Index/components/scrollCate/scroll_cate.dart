import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nzz/app/pages/Index/components/scrollCate/scroll_cate_controller.dart';
import 'package:nzz/basic.dart';

class ScrollCate extends StatelessWidget {
  final List scrollCateList;

  ScrollCate(this.scrollCateList);

  //可滑动分类的controller
  final ScrollCateController scrollCateController = Get.put(ScrollCateController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Container(
                color: ColorStyle.colorWhite,
                height: 204.r,
                child: NotificationListener<ScrollNotification>(
                  onNotification: scrollCateController.handleScrollNotification,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 187.5.r,
                        alignment: Alignment.center,
                        child: Column(children: <Widget>[
                          Image.network(
                              'https://image.dayouqiantu.cn/goods.png',
                              width: 120.r,
                              height: 120.r),
                          SizedBox(height: 10.r),
                          Text('精品馆',
                              style: TextStyle(
                                  color: ColorStyle.colorTitle, fontSize: 24.r))
                        ]),
                      );
                    },
                    itemCount: 7,
                    itemExtent: 187.5.r,
                  ),
                )),
            Positioned(
                bottom: 20.r,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffc7c7c7),
                      borderRadius: BorderRadius.all(Radius.circular(22.r))),
                  child: Align(
                    widthFactor: 2.0,
                    heightFactor: 1.0,
                    alignment: Alignment(
                        scrollCateController.actualPixels.value.toDouble(), 0),
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

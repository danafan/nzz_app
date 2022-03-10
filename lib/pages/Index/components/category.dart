import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nzz/basic.dart';

class CateGory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorStyle.colorWhite,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
          Widget>[
        GestureDetector(
          onTap:(){
            Get.toNamed("/food_page_view");
          },
          child:Container(
            width: 187.5.r,
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset('images/index_cate_food.png',
                  width: 120.r, height: 120.r),
              SizedBox(height: 10.r),
              Text('同城',
                  style:
                      TextStyle(color: ColorStyle.colorTitle, fontSize: 24.r))
            ]))),
        Container(
            width: 187.5.r,
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset('images/index_cate_quality.png',
                  width: 120.r, height: 120.r),
              SizedBox(height: 10.r),
              Text('精品馆',
                  style:
                      TextStyle(color: ColorStyle.colorTitle, fontSize: 24.r))
            ])),
        Container(
            width: 187.5.r,
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset('images/index_cate_make.png',
                  width: 120.r, height: 120.r),
              SizedBox(height: 10.r),
              Text('快速赚商城',
                  style:
                      TextStyle(color: ColorStyle.colorTitle, fontSize: 24.r))
            ])),
        Container(
            width: 187.5.r,
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset('images/index_cate_vouchers.png',
                  width: 120.r, height: 120.r),
              SizedBox(height: 10.r),
              Text('购物券商城',
                  style:
                      TextStyle(color: ColorStyle.colorTitle, fontSize: 24.r))
            ]))
      ]),
    );
  }
}

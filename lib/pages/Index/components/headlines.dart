import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:nzz/controllers/index_controller.dart';

import 'package:nzz/basic.dart';

class HeadLines extends StatelessWidget {

  //获取首页数据
  final IndexController indexController = Get.find<IndexController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('赚赚严选',
              style: TextStyle(
                  color: ColorStyle.colorText,
                  fontSize: 26.r,
                  fontWeight: FontWeight.bold)),
          SizedBox(width: 10.r),
          Container(
            width: 66.r,
            height: 32.r,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ColorStyle.colorPrimary,
                borderRadius: BorderRadius.all(Radius.circular(8.r))),
            child: Text(
              '头条',
              style: TextStyle(color: ColorStyle.colorWhite, fontSize: 22.r),
            ),
          ),
          SizedBox(width: 20.r),
          Expanded(
              child: Container(
                  height: 32.r,
                  child: Swiper(
                    scrollDirection:Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(indexController.headlines[index],
                            style: TextStyle(
                                fontSize: 24.r, color: ColorStyle.colorText));
                      },
                      itemCount: indexController.headlines.length,
                      autoplay: true)))
        ],
      ),
    );
  }
}

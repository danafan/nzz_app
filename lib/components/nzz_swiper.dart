import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:nzz/controllers/index_controller.dart';

class NzzSwiper extends StatelessWidget {
  final double height; //高度
  NzzSwiper(this.height);

  //获取首页数据
  final IndexController indexController = Get.find<IndexController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Obx(()=>ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(indexController.bannerList[index].value.pic,
                      fit: BoxFit.cover)));
            },
            itemCount: indexController.bannerList.length,
            autoplay: true,
            pagination: SwiperPagination(
                alignment: Alignment.bottomRight,
                builder: SwiperCustomPagination(
                    builder: (BuildContext context, SwiperPluginConfig config) {
                  return CustomPagination(config.activeIndex, config.itemCount);
                }))));
  }
}

//自定义指示器
class CustomPagination extends StatelessWidget {
  final int activeIndex;
  final int itemCount;
  CustomPagination(this.activeIndex, this.itemCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text(activeIndex.toString() + '/' + itemCount.toString()),
    );
  }
}

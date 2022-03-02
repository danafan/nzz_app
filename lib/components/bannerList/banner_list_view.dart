import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:nzz/components/bannerList/banner_list_controller.dart';

class BannerListView extends StatelessWidget {
  final String type; //类型（首页0,快速赚1,特惠拼2,广告位3,分类4,精品馆5,购物券6）
  final double height; //高度
  BannerListView(this.type, this.height);

  @override
  Widget build(BuildContext context) {
    //获取banner数据
    final BannerListController bannerListController =
        Get.put(BannerListController(type));
    return Container(
        height: height,
        child: Obx(() => Swiper(
            key: UniqueKey(),
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                      jsonDecode(
                          bannerListController.bannerList[index].value)['pic'],
                      fit: BoxFit.cover));
            },
            itemCount: bannerListController.bannerList.length,
            autoplay: true,
            pagination: SwiperPagination(
                alignment: Alignment.bottomRight,
                builder: SwiperCustomPagination(
                    builder: (BuildContext context, SwiperPluginConfig config) {
                  return CustomPagination(config.activeIndex, config.itemCount);
                })))));
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

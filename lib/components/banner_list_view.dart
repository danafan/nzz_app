import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:nzz/basic.dart';

// 轮播图组件
class BannerListView extends StatelessWidget {
  final bool showPagination; //是否显示指示器
  final List bannerList; //banner列表
  final double height; //高度
  BannerListView(this.bannerList, this.height, {this.showPagination = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        child: Obx(() => Swiper(
            key: UniqueKey(),
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                      jsonDecode(bannerList[index].value)['pic'],
                      fit: BoxFit.cover));
            },
            itemCount: bannerList.length,
            autoplay: bannerList.length > 1 ? true : false,
            pagination: showPagination
                ? SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: SwiperCustomPagination(builder:
                        (BuildContext context, SwiperPluginConfig config) {
                      return CustomPagination(
                          config.activeIndex, config.itemCount);
                    }))
                : null)));
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
      width: itemCount*15.r + (itemCount + 1)*10.r,
      child: paginationItem(activeIndex, itemCount),
    );
  }
}

//指示器的所有点
Widget paginationItem(activeIndex, itemCount) {
  List<Widget> itemList = [];
  for (int i = 0; i < itemCount; i++) {
    itemList.add(Container(
        width: 15.r,
        height: 4.r,
        color: activeIndex == i ? ColorStyle.colorWhite : Color(0xcc000000)));
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: itemList,
  );
}

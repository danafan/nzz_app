import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:nzz/app/controllers/index_controller.dart';

class NzzSwiper extends StatelessWidget {
  final double height; //高度
  final List imgs; //图片列表
  NzzSwiper(this.height, this.imgs);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(imgs[index], fit: BoxFit.cover));
            },
            itemCount: imgs.length,
            autoplay: true,
            pagination: SwiperPagination(
                alignment: Alignment.bottomRight,
                builder: SwiperCustomPagination(
                    builder: (BuildContext context, SwiperPluginConfig config) {
                  return CustomPagination(config.activeIndex, config.itemCount);
                }))));
  }
}

mixin indexController {
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

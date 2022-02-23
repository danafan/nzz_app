import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class IndexController extends GetxController {
  //列表控制器
  ScrollController indexController = ScrollController();
  //轮播图列表
  List<String> imgs = [
    "https://images.unsplash.com/photo-1477346611705-65d1883cee1e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1498550744921-75f79806b8a7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
  ];
  // 头条列表
  List<String> headlines = ['虎年邀你一起 虎赚赚', '分享创收 0门槛0风险', '严选品质 免费消费'];
  //可滑动分类列表
  List scrollCateList = [
    {
      'img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/95266CA46745442C9C477530B674CCE4',
      'name': '营养早餐'
    },
    {
      'img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/1CBD562199AB40DA97CACFB59941E7DD',
      'name': '卤味'
    },
    {
      'img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/7BDB776FE81B4FE8AA7ACBD502537754',
      'name': '礼盒'
    },
    {'img': 'https://image.dayouqiantu.cn/collect.png', 'name': '酒水饮料'},
    {'img': 'https://image.dayouqiantu.cn/goods.png', 'name': '休闲视频'},
    {
      'img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/1CBD562199AB40DA97CACFB59941E7DD',
      'name': '健康滋养'
    },
    {
      'img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/95266CA46745442C9C477530B674CCE4',
      'name': '测试结尾'
    }
  ];

  @override
  void onInit() {
    super.onInit();
    //列表控制器
    indexController.addListener(() {
      if (indexController.position.pixels ==
          indexController.position.maxScrollExtent) {
        print("滑动到底部");
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

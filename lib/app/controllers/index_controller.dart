import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class IndexController extends GetxController {
  //列表控制器
  ScrollController indexController = ScrollController();
  //轮播图列表
  List<String> imgs = [
    "https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/671400C0AA454D6DAF30F96F7AA76861",
    "https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/0ABA8E7301784E819AE64128A627D4DB",
    "https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/951BD7DD50AF41AAB53B600F088D3E65"
  ];
  // 头条列表
  List<String> headlines = ['虎年邀你一起 虎赚赚', '分享创收 0门槛0风险', '严选品质 免费消费'];
  //可滑动分类列表
  List scrollCateList = [
    {'img': 'https://image.dayouqiantu.cn/goods.png', 'name': '营养早餐'},
    {'img': 'https://image.dayouqiantu.cn/collect.png', 'name': '卤味'},
    {'img': 'https://image.dayouqiantu.cn/goods.png', 'name': '礼盒'},
    {'img': 'https://image.dayouqiantu.cn/collect.png', 'name': '酒水饮料'},
    {'img': 'https://image.dayouqiantu.cn/goods.png', 'name': '休闲视频'},
    {'img': 'https://image.dayouqiantu.cn/collect.png', 'name': '健康滋养'},
    {'img': 'https://image.dayouqiantu.cn/goods.png', 'name': '测试结尾'}
  ];
  //千人千面（美食）店铺列表
  List storeList = [
    {
      'img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/F415FE4872DC447CBD3F30E940D8034F',
      'store_name': '浅草君日料',
      'score': 2.0
    },
    {
      'img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/5312EE26BA6B4E918239A3A27EB715FB',
      'store_name': '海底捞火锅',
      'score': 3.6
    },
    {
      'img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/4D36ED8A08CB4DE4AC3FBBF131AFDBC1',
      'store_name': '东北风菜馆',
      'score': 4.5
    }
  ];
  //列表上面可滑动分类
  List scrollList = [
    {'id': '1', 'name': '推荐', 'subname': '热销商品'},
    {'id': '2', 'name': '休闲食品', 'subname': '坚果/糕点'},
    {'id': '3', 'name': '营养早餐', 'subname': '煎饼/果子'},
    {'id': '4', 'name': '实惠午餐', 'subname': '大排/鸡腿'},
    {'id': '5', 'name': '健康晚餐', 'subname': '蔬菜'},
    {'id': '6', 'name': '健身餐', 'subname': '鸡胸/蛋白'},
    {'id': '7', 'name': '瘦身减肥', 'subname': '0脂0卡'}
  ];
  //商品列表
  List goodsList = [
    {
      'goods_name': '中汇大米三星丁忧长粒大米大米米大米',
      'goods_img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/F415FE4872DC447CBD3F30E940D8034F',
      'show': true
    },
    {
      'goods_name': '中汇大米三星丁忧长粒大米大米米大米',
      'goods_img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/1FBAD7D3339F4C2D87253480FC45B484',
      'show': false
    },
    {
      'goods_name': '中汇大米三星丁忧长粒大米大米米大米',
      'goods_img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/F415FE4872DC447CBD3F30E940D8034F',
      'show': true
    },
    {
      'goods_name': '中汇大米三星丁忧长粒大米大米米大米',
      'goods_img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/1FBAD7D3339F4C2D87253480FC45B484',
      'show': true
    },
    {
      'goods_name': '中汇大米三星丁忧长粒大米大米米大米',
      'goods_img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/1FBAD7D3339F4C2D87253480FC45B484',
      'show': false
    },
    {
      'goods_name': '中汇大米三星丁忧长粒大米大米米大米',
      'goods_img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/1FBAD7D3339F4C2D87253480FC45B484',
      'show': true
    },
    {
      'goods_name': '中汇大米三星丁忧长粒大米大米米大米',
      'goods_img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/1FBAD7D3339F4C2D87253480FC45B484',
      'show': true
    },
    {
      'goods_name': '中汇大米三星丁忧长粒大米大米米大米',
      'goods_img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/1FBAD7D3339F4C2D87253480FC45B484',
      'show': true
    },
    {
      'goods_name': '中汇大米三星丁忧长粒大米大米米大米',
      'goods_img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/1FBAD7D3339F4C2D87253480FC45B484',
      'show': false
    },
    {
      'goods_name': '中汇大米三星丁忧长粒大米大米米大米',
      'goods_img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/1FBAD7D3339F4C2D87253480FC45B484',
      'show': true
    },
    {
      'goods_name': '中汇大米三星丁忧长粒大米大米米大米',
      'goods_img':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/1FBAD7D3339F4C2D87253480FC45B484',
      'show': true
    },
  ];
  //切换列表上面的滑动分类(重新获取列表)
  changeScroll(id) {
    print(id);
  }

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

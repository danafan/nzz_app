import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nzz/api/common_api.dart';

class FoodPageController extends GetxController {
  //列表控制器
  ScrollController listController = ScrollController();

  //banner列表
  final bannerList = [].obs;

  @override
  void onInit() {
    super.onInit();
    //获取banner列表
    getBannerList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  //下拉刷新
  void refreshGoodsList() {
    // page = 1;
    // loadNum.value = 0;
    // goodsList.clear();
    // //获取商品列表
    // getGoodsList();
  }

  //获取banner列表
  getBannerList() {
    Map<String, dynamic> params = {'type': '0'};
    CommonAPI.getBannerList(params: params).then((res) => {
          bannerList.value = res.data.banner,
        });
  }


  
}

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nzz/api/common_api.dart';
import 'package:nzz/api/goods_api.dart';

class FoodPageController extends GetxController {
  //列表控制器
  ScrollController listController = ScrollController();

  //banner列表
  final bannerList = [].obs;
  //店铺列表
  final loadNum = 0.obs; //获取列表的次数（控制列表的加载中和空页面）
  final isLoad = true.obs; //底部加载组件
  int page = 1; //当前页码
  // 返回数据
  int lastPage = 1; //最后一页的页码
  final storeList = [].obs; //店铺列表

  @override
  void onInit() {
    super.onInit();
    //获取banner列表
    getBannerList();
    //获取店铺列表
    getFoodStoreList();
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
    Map<String, dynamic> params = {'type': '7'};
    CommonAPI.getBannerList(params: params).then((res) => {
          bannerList.value = res.data.banner,
        });
  }

  //获取店铺列表
  getFoodStoreList() {
    Map<String, dynamic> params = {"type": '2', "size": 10, "number": 1};
    GoodsAPI.getFoodStoreList(params: params).then((res) => {
          lastPage = res.data.totalElements, //最后页码
          storeList..addAll(res.data.content), //店铺列表
          loadNum.value =  loadNum.value == 0?loadNum.value + 1:loadNum.value, //累计获取的次数
          // 列表底部加载状态组件
          isLoad.value = page == lastPage ? false : true
        });
  }
}

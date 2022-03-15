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

  // 吸顶元素
  GlobalKey anchorKey = GlobalKey();
  //appbar
  GlobalKey appbarKey = GlobalKey();
  //吸顶元素距离顶部高度
  double dy = 0.0;
  //滚动条位置
  double scrollTop = 0.0;

  @override
  void onInit() {
    super.onInit();
    //获取banner列表
    getBannerList();
    //获取店铺列表
    getFoodStoreList();
    //列表控制器（监听是否滑动到最底部）
    listController.addListener(() {
      //滚动条位置
      scrollTop = listController.offset;
      if (listController.position.pixels ==
          listController.position.maxScrollExtent) {
        //页码加1
        if (page < lastPage) {
          page += 1;
          //获取商品列表
          getFoodStoreList();
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    //吸顶元素
    final RenderBox renderBox = anchorKey.currentContext!.findRenderObject() as RenderBox;
    //顶部appbar
    final RenderBox appbarRenderBox = appbarKey.currentContext!.findRenderObject() as RenderBox;
    // 顶部appbar高度
    double appbarHeight = appbarRenderBox.semanticBounds.size.height;
    // 计算吸顶元素距离顶部高度
    dy = renderBox.localToGlobal(Offset.zero).dy - appbarHeight;
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
    Map<String, dynamic> params = {"type": '2', "size": 10, "number": page};
    GoodsAPI.getFoodStoreList(params: params).then((res) => {
          lastPage = ((res.data.totalElements)/10).toInt(), //最后页码
          storeList..addAll(res.data.content), //店铺列表
          loadNum.value =
              loadNum.value == 0 ? loadNum.value + 1 : loadNum.value, //累计获取的次数
          // 列表底部加载状态组件
          isLoad.value = page == lastPage ? false : true
        });
  }
}

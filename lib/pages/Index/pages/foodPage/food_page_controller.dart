import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nzz/api/common_api.dart';
import 'package:nzz/api/goods_api.dart';

class FoodPageController extends GetxController {
  //店铺列表控制器
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
  //筛选条件弹窗高度
  final modelHeight = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    //获取banner列表
    getBannerList();
    //获取店铺列表
    getFoodStoreList();
    //获取美食类型列表
    getFoodTypeList();
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
    //顶部appbar
    final RenderBox appbarRenderBox =
        appbarKey.currentContext!.findRenderObject() as RenderBox;
    // 顶部appbar高度
    double appbarHeight = appbarRenderBox.semanticBounds.size.height;
    //吸顶元素
    final RenderBox renderBox =
        anchorKey.currentContext!.findRenderObject() as RenderBox;
    //吸顶元素高度
    double anchorHeight = renderBox.semanticBounds.size.height;
    // 计算吸顶元素距离顶部高度
    dy = renderBox.localToGlobal(Offset.zero).dy - appbarHeight;
    //计算筛选条件弹窗高度
    modelHeight.value = Get.height - appbarHeight - anchorHeight;
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

  // 是否展开筛选框
  final openModel = false.obs;
  //点击的条件下标
  final currentIndex = 0.obs;
  //美食类型列表（筛选条件）
  final foodTypeList = [].obs;
  //美食类型选中的下标
  final checkFoodTypeIndex = 0.obs;
  //美食类型图标
  final foodSortIcon = 'images/food_sort_down.png'.obs;
  // 智能排序列表（筛选条件）
  List<Map> sortList = [
    {"title": "智能排序", "sort": ""},
    {"title": "距离优先", "sort": "distance asc"},
    {"title": "好评优先", "sort": "star desc"},
    {"title": "销量优先", "sort": "sale_num desc"},
    {"title": "低价优先", "sort": "avg_price asc"},
    {"title": "高价优先", "sort": "avg_price desc"}
  ];
  //智能排序选中的下标
  final sortCurrentIndex = 0.obs;

  ///智能排序图标
  final sortCurrentIcon = 'images/food_sort_down.png'.obs;

  // 筛选
  // 价格区间列表
  List<Map> priceList = [
    {"name": "50以下", "pm": "beginAvgPrice=0&endAvgPrice=50"},
    {"name": "50-100", "pm": "beginAvgPrice=50&endAvgPrice=100"},
    {"name": "100-300", "pm": "beginAvgPrice=100&endAvgPrice=300"},
    {"name": "300以上", "pm": "beginAvgPrice=300"}
  ];
  //当前选中的价格区间下标
  final currentPriceIndex = -1.obs;
  //营业时间列表
  List<Map> timeList = [
    {"name": "0-5时", "pm": "dayTimeStart=0&dayTimeEnd=5"},
    {"name": "5-10时", "pm": "dayTimeStart=5&dayTimeEnd=10"},
    {"name": "10-14时", "pm": "dayTimeStart=10&dayTimeEnd=14"},
    {"name": "14-17时", "pm": "dayTimeStart=14&dayTimeEnd=17"},
    {"name": "17-21时", "pm": "dayTimeStart=17&dayTimeEnd=21"},
    {"name": "21-24时", "pm": "dayTimeStart=21&dayTimeEnd=24"},
    {"name": "营业中", "pm": "isOpen=1"},
    {"name": "24小时营业", "pm": "dayTimeStart=0&dayTimeEnd=24"},
  ];
  //当前选中的营业时间下标
  final currentTimeIndex = -1.obs;
  //特色列表
  List<String> tagList = ["有包厢", "可停车", "宝宝椅", "Wi-Fi", "无烟区", "充电宝", "在线点餐"];

  //当前选中的特色列表
  final currentTagList = [].obs;

  //点击排序条件的某一个
  void openSortModel(index) {
    currentIndex.value = index;
    //吸顶
    if (dy > scrollTop) {
      listController.jumpTo(dy);
    }
    openModel.value = !openModel.value;
    //展开
    if (openModel.value == true) {
      if (currentIndex.value == 1) {
        //美食
        foodSortIcon.value = 'images/food_sort_up.png';
      } else if (currentIndex.value == 2) {
        //智能排序
        sortCurrentIcon.value = 'images/food_sort_up.png';
      }
    } else {
      //判断所有选项的箭头展示情况
      setArrowStatus();
    }
  }

  //切换美食类型
  void checkFoodType(index) {
    checkFoodTypeIndex.value = index;
    //判断所有选项的箭头展示情况
    setArrowStatus();
  }

  //切换智能排序
  checkCurrentSort(index) {
    sortCurrentIndex.value = index;
    //判断所有选项的箭头展示情况
    setArrowStatus();
  }

  //关闭弹窗并判断所有选项的箭头展示情况
  void setArrowStatus() {
    openModel.value = false;
    //美食
    if (checkFoodTypeIndex.value > 0) {
      foodSortIcon.value = 'images/food_sort_up.png';
    } else {
      foodSortIcon.value = 'images/food_sort_down.png';
    }
    //智能排序
    if (sortCurrentIndex.value > 0) {
      sortCurrentIcon.value = 'images/food_sort_up.png';
    } else {
      sortCurrentIcon.value = 'images/food_sort_down.png';
    }
  }

  //获取banner列表
  void getBannerList() {
    Map<String, dynamic> params = {'type': '7'};
    CommonAPI.getBannerList(params: params).then((res) => {
          bannerList.value = res.data.banner,
        });
  }

  //获取店铺列表
  void getFoodStoreList() {
    Map<String, dynamic> params = {"type": '2', "size": 10, "number": page};
    GoodsAPI.getFoodStoreList(params: params).then((res) => {
          lastPage = ((res.data.totalElements) / 10).toInt(), //最后页码
          storeList..addAll(res.data.content), //店铺列表
          loadNum.value =
              loadNum.value == 0 ? loadNum.value + 1 : loadNum.value, //累计获取的次数
          // 列表底部加载状态组件
          isLoad.value = page == lastPage ? false : true
        });
  }

  //获取美食类型列表
  void getFoodTypeList() {
    Map<String, dynamic> params = {
      "dictName": "美食类型",
      "size": 200,
      "number": 1
    };
    GoodsAPI.getFoodTypeList(params: params).then((res) => {
          foodTypeList.addAll(res.data.content),
        });
  }
}

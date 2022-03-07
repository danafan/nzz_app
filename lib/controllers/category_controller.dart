import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzz/api/common_api.dart';
import 'package:nzz/api/goods_api.dart';

class CategoryController extends GetxController {
   //列表控制器
  ScrollController listController = ScrollController();

  //banner列表（type:4）
  final bannerList = [].obs;

  //左侧分类列表
  final leftCateList = [].obs;
  //左侧当前选中下标
  final leftCurrentIndex = 0.obs;
   //左侧当前选中标题
  final leftCurrentTitle = ''.obs;
  //右侧是否展开选项
  final isOpen = 0.obs;
  //右侧子分类列表
  final rightCateList = [].obs;
  //右侧当前选中下标
  final rightCurrentIndex = 0.obs;

  //商品列表
  final loadNum = 0.obs;  //获取列表的次数（控制列表的加载中和空页面）
  final isLoad = true.obs;  //底部加载组件
  int page = 1; //当前页码
  dynamic pid = ''; //选中的左侧分类id
  dynamic sid = ''; //右侧子分类选中id
  // 返回数据
  int lastPage = 1; //最后一页的页码
  final goodsList = [].obs; //商品列表

  @override
  void onInit() {
    super.onInit();
    //列表控制器（监听是否滑动到最底部）
    listController.addListener(() {
      if (listController.position.pixels ==
          listController.position.maxScrollExtent) {
        //页码加1
        if (page < lastPage) {
          page += 1;
          //获取商品列表
          getGoodsList();
        }
      }
    });
    //获取banner列表
    getBannerList();
    //获取商品分类列表
    getCategoryList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  //获取banner列表
  getBannerList() {
    Map<String, dynamic> params = {'type': '4'};
    CommonAPI.getBannerList(params: params).then((res) => {
          bannerList.value = res.data.banner,
        });
  }

  //获取商品分类列表
  void getCategoryList() {
    GoodsAPI.getCategoryList(params: {'categoryType': '2'}).then((res) => {
              for (int i = 0; i < res.data.length; i++)
                {
                  // 首页顶部分类
                  if (res.data[i].activityStatus != -1 &&
                      res.data[i].activityStatus != 3)
                    {leftCateList.add(res.data[i])},
                },
              rightCateList.value = leftCateList[0].children, //右侧子分类列表
              // pid = leftCateList[leftCateList.length - 1].id, //设置请求参数pid(左侧选中id)
              pid = leftCateList[0].id, //设置请求参数pid(左侧选中id)
              sid = leftCateList[0].children[0].id, //设置请求参数sid(右侧子分类选中id)
              leftCurrentTitle.value = leftCateList[0].cateName, //左侧当前选中标题
            })
        .then((value) => getGoodsList())
        ;
  }

  //获取商品列表
  getGoodsList() {
    Map<String, dynamic> params = {
      "goodType": "13",
      "homeOrder": "true",
      "limit": 8,
      "page": 1,
      "pid": pid,
      "priceOrder": "",
      "salesOrder": "",
      "sid": sid
    };
    GoodsAPI.getGoodsList(params: params).then((res) => {
          lastPage = res.data.pages, //最后一页的页码
          goodsList..addAll(res.data.records), //当前页的商品列表
          loadNum.value =  loadNum.value == 0?loadNum.value + 1:loadNum.value, //累计获取的次数
          // 列表底部加载状态组件
          isLoad.value = page == lastPage ? false : true
        });
  }

  //切换左侧当前选中下标
  void changeLeftCurrentIndex(i) {
    //切换左侧当前选中下标
    leftCurrentIndex.value = i;
    //切换左侧当前选中标题
    leftCurrentTitle.value = leftCateList[i].cateName;
    //切换左侧当前选中下标
    rightCurrentIndex.value = 0;
    //右侧子分类列表
    rightCateList.value = leftCateList[i].children;
  }

  //切换右侧展开收起
  void changeOpenStatus(type) {
    isOpen.value = type;
  }

  //切换右侧当前选中下标
  void changeRightCurrentIndex(i) {
    //切换左侧当前选中下标
    rightCurrentIndex.value = i;
  }
}

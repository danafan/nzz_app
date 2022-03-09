import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzz/api/common_api.dart';
import 'package:nzz/api/goods_api.dart';

class CategoryController extends GetxController {
  //商品列表控制器
  ScrollController listController = ScrollController();
  //子分类列表控制器
  ScrollController childCateController = ScrollController();

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
              pid = leftCateList[0].id, //设置请求参数pid(左侧选中id)
              sid = leftCateList[0].children[0].id, //设置请求参数sid(右侧子分类选中id)
              leftCurrentTitle.value = leftCateList[0].cateName, //左侧当前选中标题
            })
        .then((value) => getGoodsList())
        ;
  }

  //切换左侧当前选中下标
  void changeLeftCurrentIndex(i) {
    //切换左侧当前选中下标
    leftCurrentIndex.value = i;
    //切换左侧当前选中标题
    leftCurrentTitle.value = leftCateList[i].cateName;
    //切换pid
    pid = leftCateList[i].id;
    //切换右侧当前选中下标
    rightCurrentIndex.value = 0;
    //右侧子分类列表
    rightCateList.value = leftCateList[i].children;
    //切换sid
    sid = leftCateList[i].children[0].id;
    //请求次数清0
    loadNum.value = 0;
    //清空列表
    goodsList.clear();
    //切换排序条件
    changeSort(0);
  }

  //切换右侧展开收起
  void changeOpenStatus(type) {
    isOpen.value = type;
  }

  //切换右侧当前选中下标
  void changeRightCurrentIndex(i) {
    //切换左侧当前选中下标
    rightCurrentIndex.value = i;
    //切换sid
    sid = rightCateList[i].id;
    //请求次数清0
    loadNum.value = 0;
    //清空列表
    goodsList.clear();
    //切换排序条件
    changeSort(0);
  }



  //排序条件列表
  final sortList = [{
      "name":"综合",
      "key":"homeOrder",
      "sort":"true",
      "haveIcon":false,
      "sortIcon":"images/sort_default.png"
    },{
      "name":"销量",
      "key":"salesOrder",
      "sort":"",
      "haveIcon":true,
      "sortIcon":"images/sort_default.png"
    },{
      "name":"价格",
      "key":"priceOrder",
      "sort":"",
      "haveIcon":true,
      "sortIcon":"images/sort_default.png"
    }];

  // 筛选条件当前选中的下标
  final currentSortIndex = 0.obs;

  //切换排序条件
  void changeSort(index){
    if(index == currentSortIndex.value){  //如果点击的是当前选中的（只判断有图标的）
      if(sortList[index]['sort'] == 'asc'){
        sortList[index]['sort'] = 'desc';
        sortList[index]['sortIcon'] = 'images/sort_down.png';
      }else if(sortList[index]['sort'] == 'desc'){
        sortList[index]['sort'] = 'asc';
        sortList[index]['sortIcon'] = 'images/sort_up.png';
      }
    }else{
      currentSortIndex.value = index;
      for(int i = 0;i < sortList.length;i ++){
        if(currentSortIndex.value != i){
          sortList[i]['sort'] = '';
          if(sortList[i]['haveIcon'] == true){
            sortList[i]['sortIcon'] = 'images/sort_default.png';
          }
        }else{
          if(currentSortIndex.value == 0){
            sortList[i]['sort'] = 'true';
          }else{
            sortList[i]['sort'] = 'asc';
            sortList[i]['sortIcon'] = 'images/sort_up.png';
          }
        }
      }
    }
    //请求次数清0
    loadNum.value = 0;
    //清空列表
    goodsList.clear();
    //获取商品列表
    getGoodsList();
  }

  //获取商品列表
  void getGoodsList() {
    Map<String, dynamic> params = {
      "goodType": "13",
      "homeOrder": sortList[0]['sort'],
      "limit": 8,
      "page": 1,
      "pid": pid,
      "priceOrder": sortList[2]['sort'],
      "salesOrder": sortList[1]['sort'],
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
}

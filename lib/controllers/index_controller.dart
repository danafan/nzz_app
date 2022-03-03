import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nzz/api/common_api.dart';
import 'package:nzz/api/goods_api.dart';
import 'package:nzz/components/loadMore/load_more_controller.dart';

class IndexController extends GetxController {
  //列表控制器
  ScrollController listController = ScrollController();
  //列表底部加载组件controller
  LoadMoreController loadMoreController = Get.put(LoadMoreController());

  //banner列表
  final bannerList = [].obs;

  // 头条列表
  List<String> headlines = ['虎年邀你一起 虎赚赚', '分享创收 0门槛0风险', '严选品质 免费消费'];
  //可滑动分类列表(还有分类页面的列表公用)
  final scrollCateList = [].obs;
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
  final scrollList = [].obs;

  //商品列表
  int page = 1; //当前页码
  dynamic pid = ''; //选中的菜单id
  // 返回数据
  int lastPage = 1; //最后一页的页码
  final goodsList = [].obs; //商品列表

  @override
  void onInit() {
    super.onInit();
    //获取banner列表
    getBannerList();
    //获取商品列表上面可滑动的分类列表
    getCategoryList();
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
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  //获取banner列表
  getBannerList() {
    Map<String, dynamic> params = {'type': '0'};
    CommonAPI.getBannerList(params: params).then((res) => {
          bannerList.value = res.data.banner,
        });
  }

  //切换列表上面的滑动分类(重新获取列表)
  changeScroll(id) {
    pid = id;
    //下拉刷新
    refreshGoodsList();
  }

  //下拉刷新
  void refreshGoodsList() {
    page = 1;
    goodsList.clear();
    //获取商品列表
    getGoodsList();
  }

  //获取商品分类列表（分类和下面商品列表的分类）
  void getCategoryList() {
    GoodsAPI.getCategoryList(params: {'categoryType': '2'})
        .then((res) => {
              for (int i = 0; i < res.data.length; i++)
                {
                  // 首页顶部分类
                  if (res.data[i].activityStatus != -1 &&
                      res.data[i].activityStatus != 3)
                    {scrollCateList.add(res.data[i])},
                  // 商品列表分类
                  if (res.data[i].activityStatus == -1 ||
                      res.data[i].activityStatus == 1)
                    {scrollList.add(res.data[i])}
                },
              pid = scrollList[0].id //设置请求参数pid
            })
        .then((value) => getGoodsList());
  }

  //获取商品列表
  getGoodsList() {
    Map<String, dynamic> params = {
      'page': page,
      'pid': pid,
      'goodType': 13,
      'homeOrder': 'true',
      'limit': 10
    };
    GoodsAPI.getGoodsList(params: params).then((res) => {
          lastPage = res.data.pages, //最后一页的页码
          goodsList..addAll(res.data.records), //当前页的商品列表
          // 列表底部加载状态组件
          loadMoreController.changeIsLoad(page == lastPage ? false : true)
        });
  }
}

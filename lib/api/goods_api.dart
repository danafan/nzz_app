import 'dart:convert';

import 'package:nzz/models/food_store_list_model.dart';
import 'package:nzz/models/food_type_list_model.dart';
import 'package:nzz/models/goods_category_model.dart';
import 'package:nzz/models/goods_list_model.dart';
import 'package:nzz/models/qrqm_store_model.dart';
import 'package:nzz/utils/request.dart';

class GoodsAPI {
  //获取首页可滑动商品分类列表
  static Future getCategoryList({
    required Map<String, dynamic> params,
  }) async {
    var response = await Request().get(
      'category',
      params: params,
    );
    // 增加默认的推荐
    Map<String, dynamic> cateItem = {
      'id': 'isBest',
      'pid': 1,
      'pic': '',
      'isCheck': false,
      'children': [],
      'activityStatus': -1,
      'cateName': '推荐',
      'activityName': '热销商品'
    };
    response['data'].insert(0, cateItem);
    // 子列表增加默认的全部
    Map<String, dynamic> allItem = {
      'id': '',
      'pid': -1,
      'pic':
          'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/static/cateall.png',
      'isCheck': false,
      'children': [],
      'activityStatus': -1,
      'cateName': '全部',
      'activityName': ''
    };
    for (int i = 0; i < response['data'].length; i++) {
      response['data'][i]['children'].insert(0, allItem);
    }
    return GoodsCategoryModel.fromJson(response);
  }

  //获取首页商品列表
  static Future getGoodsList({
    required Map<String, dynamic> params,
  }) async {
    var response = await Request().post(
      'productswithtotal',
      params: params,
    );
    return GoodsListModel.fromJson(response);
  }

  //首页千人千面
  static Future getQrqmStoreList() async {
    var response = await Request().get('getAdStores');
    return QrqmStoreModel.fromJson(response);
  }

  //同城美食店铺列表
  static Future getFoodStoreList({
    required Map<String, dynamic> params,
  }) async {
    var response = await Request().get(
      'store/getStoreList',
      params: params,
    );
    return FoodStoreListModel.fromJson(response);
  }

  //同城美食类型列表（筛选条件）
  static Future getFoodTypeList({
    required Map<String, dynamic> params,
  }) async {
    var response = await Request().get(
      'dictDetail',
      params:params,
    );
    Map<String, dynamic> typeItem = {
                "createTime": 1635995944000,
                "dictId":11,
                "id":31,
                "label":"全部美食",
                "sort":1,
                "value":"全部美食"
            };
    response['data']['content'].insert(0, typeItem);
    return FoodTypeListModel.fromJson(response);
  }
}

import 'dart:convert';

import 'package:nzz/pages/Index/models/goods_category_model.dart';
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
    return GoodsCategoryModel.fromJson(response);
  }
}
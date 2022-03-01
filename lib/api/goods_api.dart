import 'package:nzz/pages/Index/models/goods_category_model.dart';
import 'package:nzz/pages/Index/models/goods_list_model.dart';
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
    Map<String, dynamic> cateItem = {'id':'isBest','pid':1,'pic':'','isCheck':false,'children':[],'activityStatus':-1,'cateName':'推荐','activityName':'热销商品'};
    response['data'].insert(0,cateItem);
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
}
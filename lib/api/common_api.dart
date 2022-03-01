import 'package:nzz/models/banner_list_model.dart';
import 'package:nzz/utils/request.dart';

class CommonAPI {
  //获取banner列表
  static Future getBannerList({
    required Map<String, dynamic> params,
  }) async {
    var response = await Request().get(
      'banners',
      params: params,
    );
    return BannerListModel.fromJson(response);
  }
}
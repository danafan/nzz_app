import 'package:get/get.dart';
import 'package:nzz/api/common_api.dart';

class BannerListController extends GetxController {
  final String type;  //类型（0:首页banner列表）
  BannerListController (this.type);

  //轮播图列表
  final bannerList = [].obs;

  @override
  void onInit() {
    super.onInit();
    //获取banner列表
    getBannerList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  //获取banner列表
  getBannerList() {
    Map<String, dynamic> params = {'type': type};
    CommonAPI.getBannerList(params: params).then((res) => {
          bannerList.value = res.data.banner,
        });
  }
}

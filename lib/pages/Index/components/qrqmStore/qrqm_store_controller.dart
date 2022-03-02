import 'package:get/get.dart';
import 'package:nzz/api/goods_api.dart';

class QrqmStoreController extends GetxController {
  //千人千面（美食）店铺列表
  final storeList = [].obs;

  @override
  void onInit() {
    super.onInit();
    //千人千面列表
    getQrqmStoreList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  //千人千面列表
  getQrqmStoreList() {
    GoodsAPI.getQrqmStoreList().then((res) => {
      storeList.value = res.data.adStores,
    });
  }
}

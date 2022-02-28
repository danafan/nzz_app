import 'package:get/get.dart';

class LoadMoreController extends GetxController {
  
  //当前列表加载状态
  RxBool isLoad = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  //切换当前列表加载状态
  void changeIsLoad(status){
    isLoad.value = status;
  }


}

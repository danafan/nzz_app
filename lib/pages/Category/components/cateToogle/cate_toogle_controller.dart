import 'package:get/get.dart';

class CateToogleController extends GetxController {

  //是否展开选项
  final isOpen = false.obs;

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

  //切换展开收起
  void changeOpenStatus(type) {
    isOpen.value = type;
  }
}

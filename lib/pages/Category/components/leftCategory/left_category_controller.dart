import 'package:get/get.dart';
import 'package:nzz/controllers/index_controller.dart';

class LeftCategoryController extends GetxController {
  
  //当前选中下标
  final currentIndex = 0.obs;

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

  //切换当前选中下标
  void changeCurrentIndex(i,id){
    currentIndex.value = i;
    //首页数据Controller
    final IndexController indexController = Get.find<IndexController>();
    indexController.changeScroll(id);
  }


}

import 'package:get/get.dart';

class SortWidgetController extends GetxController {

  //排序条件列表
  final sortList = [{
      "name":"综合",
      "key":"homeOrder",
      "sort":"true",
      "isChecked":true
    },{
      "name":"销量",
      "key":"salesOrder",
      "sort":"",
      "isChecked":false
    },{
      "name":"价格",
      "key":"priceOrder",
      "sort":"",
      "isChecked":false
    }].obs;

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
}

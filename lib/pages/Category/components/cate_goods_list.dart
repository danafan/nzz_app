import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzz/components/goods_item_list_view.dart';
import 'package:nzz/components/load_more_view.dart';
import 'package:nzz/controllers/category_controller.dart';

class CateGoodsList extends StatelessWidget {
  //分类controller
  final CategoryController categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Obx(() => ListView.builder(
              controller: categoryController.listController,
              primary: false,
              itemCount: categoryController.goodsList.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == categoryController.goodsList.length) {
                  return LoadMoreView(categoryController.isLoad.value);
                } else {
                  var item = categoryController.goodsList[index];
                  return GoodsItemListView(item);
                }
              },
            )));
  }
}

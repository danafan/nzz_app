import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nzz/basic.dart';
import 'package:nzz/components/app_bar.dart';
import 'package:nzz/components/bannerList/banner_list_view.dart';
import 'package:nzz/components/listLoadEmpty/list_load_empty_view.dart';
import 'package:nzz/components/sortWidget/sort_widget_view.dart';
import 'package:nzz/controllers/category_controller.dart';
import 'package:nzz/pages/Category/components/cateToogle/cate_position_view.dart';
import 'package:nzz/pages/Category/components/cateToogle/cate_toogle_view.dart';
import 'package:nzz/pages/Category/components/cate_goods_list.dart';
import 'package:nzz/pages/Category/components/leftCategory/left_category_view.dart';

class CateGory extends StatelessWidget {
  //分类controller
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        AppBarWidget(type: '2', placeholder: '搜索商品'),
        Expanded(
            child: Row(
          children: <Widget>[
            //左侧分类
            LeftCategoryView(),
            // 右侧内容
            Expanded(
                child: Container(
                    color: ColorStyle.colorWhite,
                    child: Column(children: <Widget>[
                      //轮播图
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.r, horizontal: 30.r),
                        child: BannerListView(
                            categoryController.bannerList, 184.r,
                            showPagination: true),
                      ),
                      Expanded(
                          child: Obx(() => IndexedStack(
                                index: categoryController.isOpen.value,
                                children: <Widget>[
                                  // 筛选条件和列表
                                  Column(children: <Widget>[
                                    //可滑动分类
                                    CateToogleView(),
                                    //排序条件
                                    SortWidget(),
                                    // 商品列表
                                    Expanded(
                                        child: categoryController.loadNum == 0
                                            ? ListLoadEmptyView(false)
                                            : categoryController.loadNum == 1 &&
                                                    categoryController
                                                        .goodsList.isEmpty
                                                ? ListLoadEmptyView(true)
                                                : CateGoodsList()),
                                  ]),
                                  // 分类遮罩
                                  Positioned(child: CatePositionView())
                                ],
                              )))
                    ])))
          ],
        ))
      ],
    ));
  }
}

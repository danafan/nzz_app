import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nzz/basic.dart';
import 'package:nzz/components/app_bar.dart';
import 'package:nzz/components/banner_list_view.dart';
import 'package:nzz/components/sliver_app_bar_delegate.dart';
import 'package:nzz/pages/Index/pages/foodPage/food_page_controller.dart';

class FoodPageView extends StatelessWidget {

  //同城美食controller
  final FoodPageController foodPageController = Get.put(FoodPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.colorBackGround,
        body: Column(children: <Widget>[
          AppBarWidget(
            type: 'c',
            title:'同城',
            placeholder: '搜索商品',
            inputBackDark: true,
            isPrimary: false,
          ),
          Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(Duration(milliseconds: 1000), () {
                    foodPageController.refreshGoodsList();
                  });
                },
                child: CustomScrollView(
                  controller: foodPageController.listController,
                  slivers: <Widget>[
                    //上面内容
                    SliverToBoxAdapter(
                      child: Container(
                          color: ColorStyle.colorWhite,
                          padding: EdgeInsets.fromLTRB(20.r, 10.r, 20.r, 20.r),
                          child: Column(
                            children: <Widget>[
                              // 轮播图
                              BannerListView(foodPageController.bannerList, 280.r),
                            ],
                          )),
                    ),
                    //可吸顶
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: SliverAppBarDelegate(
                        minHeight: 150.r,
                        maxHeight: 150.r,
                        child: Text('asd'),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ]));
  }
}

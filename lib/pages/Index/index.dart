import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzz/components/bannerList/banner_list_view.dart';
import 'package:nzz/components/goods_item_grid_view.dart';
import 'package:nzz/components/listLoadEmpty/list_load_empty_view.dart';
import 'package:nzz/components/load_more_view.dart';
import 'package:nzz/pages/Index/components/category.dart';
import 'package:nzz/pages/Index/components/headlines.dart';
import 'package:nzz/pages/Index/components/qrqmStore/qrqm_store_view.dart';
import 'package:nzz/pages/Index/components/scrollBar/scroll_bar_view.dart';
import 'package:nzz/pages/Index/components/scrollCate/scroll_cate.dart';

import 'package:nzz/basic.dart';

import 'package:nzz/components/sliver_app_bar_delegate.dart';
import 'package:nzz/components/app_bar.dart';
import 'package:nzz/components/security_widget.dart';

import 'package:nzz/controllers/index_controller.dart';

class Index extends StatelessWidget {
  //首页数据controller
  final IndexController indexController = Get.put(IndexController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.colorBackGround,
        body: Column(
          children: <Widget>[
            AppBarWidget(
                type: '2',
                placeholder: '搜索商品',
                inputBackDark: true,
                isPrimary: false,
                ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(Duration(milliseconds: 1000), () {
                    indexController.refreshGoodsList();
                  });
                },
                child: CustomScrollView(
                  controller: indexController.listController,
                  slivers: <Widget>[
                    //上面内容
                    SliverToBoxAdapter(
                      child: Container(
                          color: ColorStyle.colorWhite,
                          padding: EdgeInsets.fromLTRB(20.r, 30.r, 20.r, 0),
                          child: Column(
                            children: <Widget>[
                              // 轮播图
                              BannerListView(indexController.bannerList, 280.r),
                              SizedBox(height: 15.r),
                              // 保障
                              SecurityWidget(),
                              SizedBox(height: 36.r),
                              // 头条
                              HeadLines(),
                              SizedBox(height: 38.r),
                            ],
                          )),
                    ),
                    //分类
                    SliverToBoxAdapter(
                      child: CateGory(),
                    ),
                    // 间隔
                    SliverToBoxAdapter(
                      child: Container(
                        color: ColorStyle.colorWhite,
                        height: 24.r,
                      ),
                    ),
                    //滑动分类
                    SliverToBoxAdapter(
                      child: ScrollCate(),
                    ),
                    // 间隔
                    SliverToBoxAdapter(
                      child: SizedBox(height: 20.r),
                    ),
                    // 千人千面（美食）
                    SliverToBoxAdapter(child: QrqmStoreView()),
                    //可吸顶
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: SliverAppBarDelegate(
                        minHeight: 150.r,
                        maxHeight: 150.r,
                        child: ScrollBarView(),
                      ),
                    ),
                    // 下面列表
                    Obx(() => SliverPadding(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 20.r),
                        sliver: indexController.loadNum.toInt() == 0
                            ? SliverToBoxAdapter(
                                child: ListLoadEmptyView(false))
                            : indexController.loadNum.toInt() == 1 &&
                                    indexController.goodsList.isEmpty
                                ? SliverToBoxAdapter(
                                    child: ListLoadEmptyView(true))
                                : SliverGrid(
                                    delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                        //创建子widget
                                        return GoodsItemGridView(
                                            indexController.goodsList[index]);
                                      },
                                      childCount:
                                          indexController.goodsList.length,
                                    ),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10.r, //主轴中间间距
                                      crossAxisSpacing: 10.r, //副轴中间间距
                                      childAspectRatio: 0.63, //item 宽高比
                                    )))),
                    // 列表加载状态
                     Obx(() => SliverToBoxAdapter(
                        child: Offstage(
                      offstage: indexController.goodsList.isEmpty,
                      child: LoadMoreView(indexController.isLoad.value),
                    )))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

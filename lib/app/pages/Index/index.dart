import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzz/app/components/staggered_grid_view.dart';
import 'package:nzz/app/pages/Index/components/category.dart';
import 'package:nzz/app/pages/Index/components/headlines.dart';
import 'package:nzz/app/pages/Index/components/qrqm_swiper.dart';
import 'package:nzz/app/pages/Index/components/scrollBar/scroll_bar_view.dart';
import 'package:nzz/app/pages/Index/components/scrollCate/scroll_cate.dart';



import 'package:nzz/basic.dart';

import 'package:nzz/app/components/nzz_swiper.dart';
import 'package:nzz/app/components/sliver_app_bar_delegate.dart';
import 'package:nzz/app/components/app_bar.dart';
import 'package:nzz/app/components/security_widget.dart';

import 'package:nzz/app/controllers/index_controller.dart';

class Index extends StatelessWidget {
  //首页数据controller
  IndexController indexController = Get.put(IndexController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        AppBarWidget(
            type: '2',
            placeholder: '搜索商品',
            inputBackDark: true,
            isPrimary: false),
        Expanded(
            child: 
          //   Container(
          // color: ColorStyle.colorBackGround,
          // child: 
          RefreshIndicator(
            onRefresh: () {
              return Future.delayed(Duration(milliseconds: 1000), () {
                print('刷新了');
              });
            },
            child: CustomScrollView(
              controller: indexController.indexController,
              slivers: <Widget>[
                //上面内容
                SliverToBoxAdapter(
                  child: Container(
                      color: ColorStyle.colorWhite,
                      padding: EdgeInsets.fromLTRB(20.r, 30.r, 20.r, 0),
                      child: Column(
                        children: <Widget>[
                          //  轮播图
                          NzzSwiper(280.r, indexController.imgs),
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
                SliverToBoxAdapter(child: QrqmSwiper()),
                //可吸顶
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: 150.r,
                    maxHeight: 150.r,
                    child: ScrollBarView(),
                  ),
                ),
                // 下面列表
                SliverToBoxAdapter(child: StaggeredGridView()),
                // SliverList(
                //     delegate: SliverChildBuilderDelegate(
                //   (context, index) {
                //     return Container(
                //       height: 50,
                //       color: index % 2 == 0 ? Colors.white : Colors.black12,
                //       width: double.infinity,
                //       alignment: Alignment.center,
                //       child: Text("我是第${index}个item"),
                //     );
                //   },
                //   childCount: 30,
                // ))
              ],
            ),
          ),
        // )
        )
      ],
    ));
  }
}

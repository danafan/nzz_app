import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzz/app/pages/Index/components/category.dart';
import 'package:nzz/app/pages/Index/components/headlines.dart';
import 'package:nzz/app/pages/Index/components/scrollCate/scroll_cate.dart';

import 'package:nzz/basic.dart';

import 'package:nzz/app/components/common/nzz_swiper.dart';
import 'package:nzz/app/components/common/sliver_app_bar_delegate.dart';
import 'package:nzz/app/components/common/app_bar.dart';
import 'package:nzz/app/components/common/security_widget.dart';

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
            child: Container(
          color: ColorStyle.colorWhite,
          child: RefreshIndicator(
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
                          HeadLines(indexController.headlines),
                          SizedBox(height: 38.r),
                          // 分类
                          CateGory(),
                          //滑动分类
                          ScrollCate(indexController.scrollCateList)
                        ],
                      )),
                ),
                //可吸顶
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: 100.r,
                    maxHeight: 100.r,
                    child: Container(color: Colors.red, height: 100.r),
                  ),
                ),
                // 下面列表
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      height: 50,
                      color: index % 2 == 0 ? Colors.white : Colors.black12,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text("我是第${index}个item"),
                    );
                  },
                  childCount: 30,
                ))
              ],
            ),
          ),
        ))
      ],
    ));
  }
}

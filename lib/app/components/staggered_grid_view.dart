import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:nzz/app/components/zf_tag_widget.dart';
import 'package:nzz/app/controllers/index_controller.dart';
import 'package:nzz/basic.dart';

class StaggeredGridView extends StatelessWidget {
  //获取首页数据
  final IndexController indexController = Get.find<IndexController>();

  final List<Map<String, dynamic>> _items = List.generate(
      30,
      (index) => {
            "id": index,
            "title": "Item $index",
            "height": Random().nextInt(150) + 50.5
          });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MasonryGridView.count(
          shrinkWrap: true,
          itemCount: indexController.goodsList.length,
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          crossAxisCount: 2,
          mainAxisSpacing: 10.r,
          crossAxisSpacing: 10.r,
          itemBuilder: (context, index) {
            return GoodsItemWidget(indexController.goodsList[index]);
          },
        ));
  }
}

class GoodsItemWidget extends StatelessWidget {
  //每一个 商品
  final goodsItem;
  GoodsItemWidget(this.goodsItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorStyle.colorWhite,
          borderRadius: BorderRadius.circular(4.r)),
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.r),
                  topRight: Radius.circular(4.r)),
              child: Image.network(goodsItem['goods_img'],
                  width: 350.r, height: 350.r, fit: BoxFit.cover)),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
            child: Column(children: <Widget>[
              Text(
                goodsItem['goods_name'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: ColorStyle.colorText,
                    fontSize: 28.r,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10.r),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: '8.',
                      style: TextStyle(
                          color: ColorStyle.colorPrimary,
                          fontSize: 44.r,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                            text: '99',
                            style: TextStyle(
                              color: ColorStyle.colorPrimary,
                              fontSize: 24.r,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.r),
                  Text('京东价200元',
                      style: TextStyle(
                          color: ColorStyle.colorDesc,
                          fontSize: 20.r,
                          decoration: TextDecoration.lineThrough))
                ],
              ),
              Offstage(
                  offstage: goodsItem['show'], child: SizedBox(height: 10.r)),
              Offstage(
                offstage: goodsItem['show'],
                child: Row(
                  children: <Widget>[
                    ZfTagWidget('自购省', ColorStyle.colorPrimary, 3),
                     SizedBox(width: 10.r),
                    ZfTagWidget('分享赚', Color(0xffff5232), 5),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzz/basic.dart';
import 'package:nzz/components/discount_widget.dart';
import 'package:nzz/components/grade_star_view.dart';
import 'package:nzz/components/vou_pre_widget.dart';

class FoodStoreItem extends StatelessWidget {
  final item;
  FoodStoreItem(this.item);

  @override
  Widget build(BuildContext context) {
    //折扣
    String discount = '';
    // 是否新客专享
    int isExclusive = 0;
    // 处理券和惠
    List vou = [];
    List pre = [];
    if (item.storeProducts.length > 0) {
      //折扣
      if (item.storeProducts[0].otPrice > 0) {
        discount = (item.storeProducts[0].price / item.storeProducts[0].otPrice)
            .toStringAsFixed(1);
      }
      // 是否新客专享
      isExclusive = item.storeProducts[0].isExclusive;
      for (int i = 0; i < item.storeProducts.length; i++) {
        if (item.storeProducts[i].type == 4) {
          //券
          vou.add(item.storeProducts[i].storeName);
        } else {
          //惠
          pre.add(item.storeProducts[i].storeName);
        }
      }
    }

    return Container(
      margin: EdgeInsets.only(bottom: 20.r),
      padding: EdgeInsets.symmetric(vertical: 30.r, horizontal: 20.r),
      decoration: BoxDecoration(
          color: ColorStyle.colorWhite,
          borderRadius: BorderRadius.circular(8.r)),
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(item.image,
                fit: BoxFit.cover, width: 140.r, height: 140.r)),
        SizedBox(width: 20.r),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 上面店铺信息（高度和主图一致）
            Container(
              height: 140.r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // 店铺名称
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: ColorStyle.colorText,
                        fontSize: 32.r,
                        fontWeight: FontWeight.bold),
                  ),
                  // 星级评分
                  Row(children: <Widget>[
                    GradeStarView(double.parse(item.star), size: 30),
                    SizedBox(width: 5.r),
                    RichText(
                      text: TextSpan(
                        text: '${item.star}',
                        style: TextStyle(
                            color: ColorStyle.colorPrimary,
                            fontSize: 24.r,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                              text: '分',
                              style: TextStyle(
                                  color: ColorStyle.colorPrimary,
                                  fontSize: 20.r)),
                        ],
                      ),
                    ),
                    SizedBox(width: 28.r),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: '¥',
                              style: TextStyle(
                                  color: ColorStyle.colorDesc, fontSize: 20.r)),
                          TextSpan(
                              text: '${item.avgPrice}/人',
                              style: TextStyle(
                                  color: ColorStyle.colorDesc, fontSize: 24.r)),
                        ],
                      ),
                    )
                  ]),
                  // 简介和距离
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        item.introduction,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorStyle.colorDesc, fontSize: 24.r),
                      )),
                      Row(
                        children: <Widget>[
                          Image.asset('images/location_icon.png',
                              width: 20.r, height: 20.r),
                          SizedBox(width: 5.r),
                          Text(
                            '3.2km',
                            style: TextStyle(
                                color: ColorStyle.colorDesc, fontSize: 24.r),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            // 空白
            Offstage(
                offstage: item.storeProducts.length == 0,
                child: SizedBox(height: 22.r)),
            // 展示的商品
            Offstage(
              offstage: item.storeProducts.length == 0,
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    height: 134.r,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.r, horizontal: 20.r),
                    decoration: BoxDecoration(
                        color: Color(0Xfffafafa),
                        borderRadius: BorderRadius.circular(4.r)),
                    child: Row(children: <Widget>[
                      // 商品主图（套餐的时候显示）
                      Offstage(
                          offstage: item.storeProducts.length > 0 &&
                              item.storeProducts[0].type != 5,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.network(
                                  item.storeProducts.length > 0
                                      ? item.storeProducts[0].image
                                      : 'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/4D36ED8A08CB4DE4AC3FBBF131AFDBC1',
                                  fit: BoxFit.cover,
                                  width: 106.r,
                                  height: 106.r))),
                      //空白，和主图一样的显示
                      Offstage(
                          offstage: item.storeProducts.length > 0 &&
                              item.storeProducts[0].type != 5,
                          child: SizedBox(
                            width: 20.r,
                          )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            item.storeProducts.length > 0
                                ? item.storeProducts[0].storeName
                                : '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: ColorStyle.colorText,
                                fontSize: 28.r,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: '¥',
                                style: TextStyle(
                                    color: ColorStyle.colorPrimary,
                                    fontSize: 20.r),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: item.storeProducts.length > 0
                                          ? item.storeProducts[0].price
                                              .toString()
                                          : '',
                                      style: TextStyle(
                                          color: ColorStyle.colorPrimary,
                                          fontSize: 28.r,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Offstage(
                              offstage: item.storeProducts.length > 0 &&
                                  item.storeProducts[0].otPrice <= 0,
                              child: SizedBox(width: 10.r),
                            ),
                            Offstage(
                                offstage: item.storeProducts.length > 0 &&
                                    item.storeProducts[0].otPrice <= 0,
                                child: Text(
                                  '¥${item.storeProducts.length > 0 ? item.storeProducts[0].otPrice.toString() : ''}',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: ColorStyle.colorDesc,
                                      fontSize: 20.r),
                                )),
                            Offstage(
                                offstage: item.storeProducts.length > 0 &&
                                    item.storeProducts[0].otPrice <= 0,
                                child: SizedBox(width: 10.r)),
                            Offstage(
                                offstage: item.storeProducts.length > 0 &&
                                    item.storeProducts[0].otPrice <= 0,
                                child: DiscountWidget(discount))
                          ])
                        ],
                      )),
                      SizedBox(
                        width: 40.r,
                      ),
                      // 抢购按钮
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.r, horizontal: 20.r),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              gradient: LinearGradient(colors: <Color>[
                                Color(0xffff626f),
                                Color(0xffff333c),
                              ])),
                          child: Text(
                            '抢购',
                            style: TextStyle(
                                color: ColorStyle.colorWhite,
                                fontSize: 28.r,
                                fontWeight: FontWeight.bold),
                          ))
                    ]),
                  ),
                  //新客专享
                  Positioned(
                      top: -17.r,
                      right: 0.0,
                      child: Offstage(
                          offstage: isExclusive == 0,
                          child: Container(
                            width: 106.r,
                            height: 34.r,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xffff5232),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Text('新客专享',
                                style: TextStyle(
                                    color: ColorStyle.colorWhite,
                                    fontSize: 22.r,
                                    fontWeight: FontWeight.bold)),
                          )))
                ],
              ),
            ),
            Offstage(
                offstage: item.storeProducts.length == 0,
                child: SizedBox(height: 10.r)),
            //券和惠
            Offstage(
              offstage: vou.isEmpty,
              child: VouPreWidget('1', vou.join(','), false),
            ),
            Offstage(
              offstage: pre.isEmpty,
              child: VouPreWidget('2', pre.join(','), false),
            )
          ],
        )),
      ]),
    );
  }
}

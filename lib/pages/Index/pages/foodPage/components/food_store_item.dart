import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzz/basic.dart';
import 'package:nzz/components/discount_widget.dart';
import 'package:nzz/components/grade_star_view.dart';

class FoodStoreItem extends StatelessWidget {
  final item;
  FoodStoreItem(this.item);

  @override
  Widget build(BuildContext context) {
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
            // 展示的商品
            Offstage(
              offstage: item.storeProducts.length == 0,
              child: Container(
                margin: EdgeInsets.only(top:22.r),
                height: 134.r,
                padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 20.r),
                decoration: BoxDecoration(
                    color: Color(0Xfffafafa),
                    borderRadius: BorderRadius.circular(4.r)),
                child: Row(children: <Widget>[
                  // 商品主图（套餐的时候显示）
                  Offstage(
                      offstage: 1 == 2,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.network(
                              'https://zhuanzhuanyanxuan.oss-cn-beijing.aliyuncs.com/5312EE26BA6B4E918239A3A27EB715FB',
                              fit: BoxFit.cover,
                              width: 106.r,
                              height: 106.r))),
                  //空白，和主图一样的显示
                  Offstage(
                      offstage: 1 == 2,
                      child: SizedBox(
                        width: 25.r,
                      )),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '这是商品名称这是商品名称这是商品名称',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorStyle.colorText,
                            fontSize: 28.r,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: '¥',
                                style: TextStyle(
                                    color: ColorStyle.colorPrimary,
                                    fontSize: 20.r),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '180',
                                      style: TextStyle(
                                          color: ColorStyle.colorPrimary,
                                          fontSize: 28.r,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Text(
                              '¥299',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: ColorStyle.colorDesc,
                                  fontSize: 20.r),
                            ),
                            DiscountWidget(8.3)
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
            ),
          ],
        )),
      ]),
    );
  }
}

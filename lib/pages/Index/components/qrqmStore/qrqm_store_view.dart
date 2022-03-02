import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:nzz/components/grade_star_view.dart';
import 'package:nzz/basic.dart';
import 'package:nzz/models/qrqm_store_model.dart';
import 'package:nzz/pages/Index/components/qrqmStore/qrqm_store_controller.dart';

class QrqmStoreView extends StatelessWidget {
  //千人千面
  final QrqmStoreController qrqmStoreController =
      Get.put(QrqmStoreController());

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 275.r,
        padding: EdgeInsets.only(left: 20.r, right: 20.r),
        child: Obx(() => Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  decoration: BoxDecoration(
                    color: ColorStyle.colorWhite,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 30.r, horizontal: 20.r),
                  child: Row(children: <Widget>[
                    // 左侧店铺主图
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.network(
                            qrqmStoreController.storeList[index].image,
                            fit: BoxFit.cover,
                            width: 215.r,
                            height: 215.r)),
                    SizedBox(width: 20.r),
                    // 右侧店铺内容
                    Expanded(
                        child: Container(
                            height: 215.r,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                      // 店铺名称
                                      Text(
                                          qrqmStoreController
                                              .storeList[index].name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: ColorStyle.colorTitle,
                                              fontSize: 32.r,
                                              fontWeight: FontWeight.w600)),
                                      // 星级评分
                                      Row(children: <Widget>[
                                        GradeStarView(
                                            qrqmStoreController
                                                .storeList[index].star,
                                            size: 30),
                                        SizedBox(width: 5.r),
                                        RichText(
                                          text: TextSpan(
                                            text:
                                                '${qrqmStoreController.storeList[index].star}',
                                            style: TextStyle(
                                                color: Color(0xffff4500),
                                                fontSize: 24.r,
                                                fontWeight: FontWeight.w500),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: '分',
                                                  style: TextStyle(
                                                    color: Color(0xffff4500),
                                                    fontSize: 18.r,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                            ],
                                          ),
                                        )
                                      ]),
                                      // 类型、位置、距离
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            qrqmStoreController
                                                .storeList[index].foodType,
                                            style: TextStyle(
                                                color: ColorStyle.colorDesc,
                                                fontSize: 24.r),
                                          ),
                                          SizedBox(width: 20.r),
                                          Expanded(
                                              child: Text(
                                            qrqmStoreController
                                                .storeList[index].address,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: ColorStyle.colorDesc,
                                                fontSize: 24.r),
                                          )),
                                          Row(
                                            children: <Widget>[
                                              Image.asset(
                                                  'images/location_icon.png',
                                                  width: 20.r,
                                                  height: 20.r),
                                              SizedBox(width: 7.r),
                                              Text(
                                                '3.5km',
                                                style: TextStyle(
                                                    color: ColorStyle.colorDesc,
                                                    fontSize: 24.r),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ]))),
                                // 券/惠
                                preWidget(qrqmStoreController
                                    .storeList[index].productVos),
                              ],
                            )))
                  ]));
            },
            itemCount: qrqmStoreController.storeList.length,
            autoplay: true)));
  }
}

// 券和惠
Widget preWidget(productVos) {
  List<ProductVo> productList = productVos;
  List<Widget> widgetList = [];
  for (int i = 0; i < productList.length; i++) {
    widgetList.add(Container(
        margin: EdgeInsets.only(top: 10.r),
        child: Row(
          children: <Widget>[
            Image.asset(
                productList[i].type == 4
                    ? 'images/quan_icon.png'
                    : 'images/hui_icon.png',
                width: 35.r,
                height: 33.r),
            SizedBox(width: 20.r),
            Expanded(child: LayoutBuilder(builder: (context, viewport) {
              var dd = productList[i].type == 4 ? 130.r : 20.r;
              var maxWidth = viewport.maxWidth - dd;
              return Row(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: Text(
                      productList[i].name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: ColorStyle.colorTitle, fontSize: 24.r),
                    ),
                  ),
                  SizedBox(width: 20.r),
                  Offstage(
                      offstage: productList[i].type != 4,
                      child: Image.asset('images/xkzx_icon.png',
                          width: 110.r, height: 32.r))
                ],
              );
            })),
          ],
        )));
  }
  return Container(
      height: 86.r,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end, children: widgetList));
}

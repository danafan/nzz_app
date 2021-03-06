import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:nzz/components/grade_star_view.dart';
import 'package:nzz/basic.dart';
import 'package:nzz/components/vou_pre_widget.dart';
import 'package:nzz/controllers/index_controller.dart';
import 'package:nzz/models/qrqm_store_model.dart';

class QrqmStoreView extends StatelessWidget {
  //首页数据controller
  final IndexController indexController = Get.put(IndexController());

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
                            indexController.storeList[index].image,
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
                                          indexController.storeList[index].name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: ColorStyle.colorTitle,
                                              fontSize: 32.r,
                                              fontWeight: FontWeight.w600)),
                                      // 星级评分
                                      Row(children: <Widget>[
                                        GradeStarView(
                                            indexController
                                                .storeList[index].star,
                                            size: 30),
                                        SizedBox(width: 5.r),
                                        RichText(
                                          text: TextSpan(
                                            text:
                                                '${indexController.storeList[index].star}',
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
                                            indexController
                                                .storeList[index].foodType,
                                            style: TextStyle(
                                                color: ColorStyle.colorDesc,
                                                fontSize: 24.r),
                                          ),
                                          SizedBox(width: 20.r),
                                          Expanded(
                                              child: Text(
                                            indexController
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
                                preWidget(indexController
                                    .storeList[index].productVos),
                              ],
                            )))
                  ]));
            },
            itemCount: indexController.storeList.length,
            autoplay: true)));
  }
}

// 券和惠
Widget preWidget(productVos) {
  List<ProductVo> productList = productVos;
  List<Widget> widgetList = [];
  for (int i = 0; i < productList.length; i++) {
    widgetList.add(VouPreWidget(productList[i].type == 4 ? '1' : '2',
        productList[i].name, productList[i].type != 4));
  }
  return Container(
      height: 86.r,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end, children: widgetList));
}

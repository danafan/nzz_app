import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:nzz/app/components/grade_star_view.dart';
import 'package:nzz/app/controllers/index_controller.dart';
import 'package:nzz/basic.dart';

class QrqmSwiper extends StatelessWidget {

  //获取首页数据
  final IndexController indexController = Get.find<IndexController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 275.r,
        padding: EdgeInsets.only(left: 20.r, right: 20.r),
        child: Swiper(
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
                        child: Image.network(indexController.storeList[index]['img'],
                            fit: BoxFit.cover, width: 215.r, height: 215.r)),
                    SizedBox(width: 20.r),
                    // 右侧店铺内容
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // 店铺名称
                        Text(indexController.storeList[index]['store_name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: ColorStyle.colorTitle,
                                fontSize: 32.r,
                                fontWeight: FontWeight.w600)),
                        // 星级评分
                        GradeStarView(indexController.storeList[index]['score'],size:30),
                        // 类型、位置、距离
                        Row(
                          children: <Widget>[
                            Text(
                              '火锅烧烤',
                              style: TextStyle(
                                  color: ColorStyle.colorDesc, fontSize: 24.r),
                            ),
                            SizedBox(width: 20.r),
                            Expanded(
                                child: Text(
                              '成都光谷步行街',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: ColorStyle.colorDesc, fontSize: 24.r),
                            )),
                            Row(
                              children: <Widget>[
                                Image.asset('images/location_icon.png',
                                    width: 20.r, height: 20.r),
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
                        ),
                        // 券
                        Row(
                          children: <Widget>[
                            Image.asset('images/quan_icon.png',
                                width: 35.r, height: 33.r),
                            SizedBox(width: 20.r),
                            Expanded(child:
                                LayoutBuilder(builder: (context, viewport) {
                              var maxWidth = viewport.maxWidth - 130.r;
                              return Row(
                                children: <Widget>[
                                  Container(
                                    constraints:
                                        BoxConstraints(maxWidth: maxWidth),
                                    child: Text(
                                      '80代100元券',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: ColorStyle.colorTitle,
                                          fontSize: 24.r),
                                    ),
                                  ),
                                  SizedBox(width: 20.r),
                                  Image.asset('images/xkzx_icon.png',
                                      width: 110.r, height: 32.r)
                                ],
                              );
                            })),
                          ],
                        ),
                        // 惠
                        Row(
                          children: <Widget>[
                            Image.asset('images/hui_icon.png',
                                width: 35.r, height: 33.r),
                            SizedBox(width: 20.r),
                            Expanded(
                                child: Text(
                              '120元4人火锅套餐',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: ColorStyle.colorTitle, fontSize: 24.r),
                            )),
                          ],
                        )
                      ],
                    ))
                  ]));
            },
            itemCount: indexController.storeList.length,
            autoplay: true));
  }
}

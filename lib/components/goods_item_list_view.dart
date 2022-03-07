import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzz/basic.dart';
import 'package:nzz/components/zf_tag_widget.dart';

class GoodsItemListView extends StatelessWidget {
  final item;
  GoodsItemListView(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1.r, color: Color(0xffe6e6e6)))),
      height: 220.r,
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: Row(
        children: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Image.network(item.image, width: 190.r, height: 190.r),
              Positioned(
                  top: -14.r,
                  child: Offstage(
                      offstage: item.type != 1 && item.type != 3,
                      child: Image.asset(
                          item.type == 1
                              ? 'images/ksz_tag.png'
                              : 'images/jpg_tag.png',
                          width: 74.r,
                          height: 28.r)))
            ],
          ),
          SizedBox(width: 20.r),
          Expanded(
              child: Container(
            height: 190.r,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(children: [
                            WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Offstage(
                                    offstage: item.thirdPrice == 0,
                                    child: thirdTag(item.thirdCompareName,
                                        item.thirdPrice))),
                            TextSpan(
                              text: item.storeName,
                              style: TextStyle(
                                  height: 1.6,
                                  color: ColorStyle.colorTitle,
                                  fontSize: 24.r,
                                  fontWeight: FontWeight.w600),
                            )
                          ])),
                      SizedBox(height: 12.r),
                      Row(
                        children: <Widget>[
                          // 不是购物券商城
                          Offstage(
                              offstage: item.type != 2,
                              child: ZfTagWidget('自购省', ColorStyle.colorPrimary,
                                  item.selfBuyMoney.toStringAsFixed(1))),
                          Offstage(
                              offstage: item.type != 2,
                              child: SizedBox(width: 10.r)),
                          ZfTagWidget('分享赚', Color(0xffff5232),
                              item.shareBuyMoney.toStringAsFixed(1)),
                        ],
                      )
                    ],
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: '到手价',
                        style: TextStyle(
                            color: Color(0xff989898),
                            fontSize: 20.r,
                            fontWeight: FontWeight.w400)),
                    WidgetSpan(child: SizedBox(width: 10.r)),
                    TextSpan(
                      text: '¥${item.price}',
                      style: TextStyle(
                          color: ColorStyle.colorPrimary,
                          fontSize: 28.r,
                          fontWeight: FontWeight.w600),
                    )
                  ]))
                ]),
          ))
        ],
      ),
    );
  }
}

// 商品名称左侧的标签
Widget thirdTag(labelText, number) {
  return Container(
    margin: EdgeInsets.only(right: 10.r),
    decoration: BoxDecoration(
        border: Border.all(color: Color(0xffFF932A)),
        borderRadius: BorderRadius.circular(6.r)),
    height: 30.r,
    width: 124.r,
    child: Row(
      children: <Widget>[
        Container(
            color: Color(0xffFF932A),
            alignment: Alignment.center,
            width: 66.r,
            child: Text(
              labelText,
              style: TextStyle(
                  color: ColorStyle.colorWhite,
                  fontSize: 20.r,
                  fontWeight: FontWeight.w600),
            )),
        Expanded(
            child: Container(
                color: ColorStyle.colorWhite,
                alignment: Alignment.center,
                child: Text(
                  '¥$number',
                  style: TextStyle(
                      color: ColorStyle.colorPrimary,
                      fontSize: 20.r,
                      fontWeight: FontWeight.w600),
                )))
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzz/components/zf_tag_widget.dart';
import 'package:nzz/basic.dart';

// 商品grid列表item组件
class GoodsItemGridView extends StatelessWidget {
  //每一个 商品
  final goodsItem;
  GoodsItemGridView(this.goodsItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.r,
      decoration: BoxDecoration(
          color: ColorStyle.colorWhite,
          borderRadius: BorderRadius.circular(4.r)),
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.r),
                  topRight: Radius.circular(4.r)),
              child: Image.network(goodsItem.image,
                  width: 350.r, height: 350.r, fit: BoxFit.cover)),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    goodsItem.storeName,
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
                          text: '${goodsItem.price.toString().split('.')[0]}.',
                          style: TextStyle(
                              color: ColorStyle.colorPrimary,
                              fontSize: 44.r,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: goodsItem.price.toString().split('.')[1],
                                style: TextStyle(
                                  color: ColorStyle.colorPrimary,
                                  fontSize: 24.r,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.r),
                      Offstage(
                          offstage: goodsItem.thirdPrice <= 0,
                          child: Text(
                              '${goodsItem.thirdCompareName}${goodsItem.thirdPrice.toStringAsFixed(1)}元',
                              style: TextStyle(
                                  color: ColorStyle.colorDesc,
                                  fontSize: 20.r,
                                  decoration: TextDecoration.lineThrough))),
                    ],
                  ),
                  SizedBox(height: 10.r),
                  Row(
                    children: <Widget>[
                      Offstage(
                          offstage: goodsItem.type == 2,
                          child:
                              ZfTagWidget('自购省', ColorStyle.colorPrimary, goodsItem.selfBuyMoney.toDouble().toStringAsFixed(1))),
                      Offstage(
                          offstage: goodsItem.type == 2,
                          child: SizedBox(width: 10.r)),
                      ZfTagWidget('分享赚', Color(0xffff5232), goodsItem.shareBuyMoney.toDouble().toStringAsFixed(1)),
                    ],
                  )
                ]),
          ),
        ],
      ),
    );
  }
}

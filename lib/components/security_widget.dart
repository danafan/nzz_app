import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzz/basic.dart';

//首页轮播图下面的红色提示
class SecurityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.asset('images/focus_icon.png',width: 24.r,height: 24.r),
            SizedBox(width: 6.r),
            Text('专注饮食安全',style: TextStyle(fontSize: 20.r,color:ColorStyle.colorPrimary),)
          ],
        ),
        Row(
          children: <Widget>[
            Image.asset('images/quality_icon.png',width: 24.r,height: 24.r),
            SizedBox(width: 6.r),
            Text('100%品质严选',style: TextStyle(fontSize: 20.r,color:ColorStyle.colorPrimary),)
          ],
        ),
        Row(
          children: <Widget>[
            Image.asset('images/money_icon.png',width: 24.r,height: 24.r),
            SizedBox(width: 6.r),
            Text('0风险分享赚钱',style: TextStyle(fontSize: 20.r,color:ColorStyle.colorPrimary),)
          ],
        )
      ],
    ));
  }
}

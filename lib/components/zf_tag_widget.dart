import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzz/components/dashed_line.dart';
import 'package:nzz/basic.dart';

//自购省、分享赚标签组件
class ZfTagWidget extends StatelessWidget {
  final labelText; //名称
  final bgColor; //背景色
  final number; //数字
  ZfTagWidget(this.labelText, this.bgColor, this.number);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: bgColor),
          borderRadius: BorderRadius.circular(6.r)),
      height: 30.r,
      child: Row(
        children: <Widget>[
          Container(
              color: bgColor,
              alignment: Alignment.center,
              width: 70.r,
              child: Text(
                labelText,
                style: TextStyle(color: ColorStyle.colorWhite, fontSize: 18.r),
              )),
          //虚线
          DashedLine(Axis.vertical, 3.r, 2.r, bgColor),
          Container(
              color: ColorStyle.colorWhite,
              padding: EdgeInsets.symmetric(horizontal: 5.r),
              child: Text(
                '$number元',
                style: TextStyle(color: bgColor, fontSize: 18.r),
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzz/basic.dart';

//券和惠
class VouPreWidget extends StatelessWidget {

  final String iconType;  //  图标类型（1:券；2:惠）
  final String value;     //  文字
  final bool showXkzx;    // 是否显示新客专享

  VouPreWidget(this.iconType,this.value,this.showXkzx);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.r),
        child: Row(
          children: <Widget>[
            Image.asset(
                iconType == '1'
                    ? 'images/quan_icon.png'
                    : 'images/hui_icon.png',
                width: 35.r,
                height: 33.r),
            SizedBox(width: 20.r),
            Expanded(child: LayoutBuilder(builder: (context, viewport) {
              var dd = showXkzx == true ? 130.r : 20.r;
              var maxWidth = viewport.maxWidth - dd;
              return Row(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: Text(
                      value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: ColorStyle.colorTitle, fontSize: 24.r),
                    ),
                  ),
                  SizedBox(width: 20.r),
                  Offstage(
                      offstage: showXkzx == false,
                      child: Image.asset('images/xkzx_icon.png',
                          width: 110.r, height: 32.r))
                ],
              );
            })),
          ],
        ));
  }
}

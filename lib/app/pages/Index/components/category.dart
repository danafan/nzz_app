import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzz/basic.dart';

class CateGory extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children:<Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Image.asset('images/index_cate_food.png',width: 120.r,height: 120.r),
              SizedBox(height: 10.r),
              Text('同城',style: TextStyle(color: ColorStyle.colorTitle,fontSize: 24.r))
            ]
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Image.asset('images/index_cate_quality.png',width: 120.r,height: 120.r),
              SizedBox(height: 10.r),
              Text('精品馆',style: TextStyle(color: ColorStyle.colorTitle,fontSize: 24.r))
            ]
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Image.asset('images/index_cate_make.png',width: 120.r,height: 120.r),
              SizedBox(height: 10.r),
              Text('快速赚商城',style: TextStyle(color: ColorStyle.colorTitle,fontSize: 24.r))
            ]
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Image.asset('images/index_cate_vouchers.png',width: 120.r,height: 120.r),
              SizedBox(height: 10.r),
              Text('购物券商城',style: TextStyle(color: ColorStyle.colorTitle,fontSize: 24.r))
            ]
          )
        ]
      ),
    );
  }
}
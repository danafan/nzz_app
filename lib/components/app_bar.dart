import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nzz/basic.dart';

class AppBarWidget extends StatelessWidget {
  final String type; //类型（1:普通箭头加标题；2:只一个搜索框）
  final String placeholder; //搜索框默认提示
  final String title; //标题
  final bool isPrimary; //背景色是否是主题色
  final bool inputBackDark; //搜索框背景色是否是深色
  AppBarWidget(
      {this.type = '1',
      this.placeholder = '',
      this.title = '',
      this.isPrimary = true,
      this.inputBackDark = false});

  @override
  Widget build(BuildContext context) {
    //设置状态栏颜色
    SystemChrome.setSystemUIOverlayStyle(
        isPrimary ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // 状态栏
        Container(
          color: isPrimary ? ColorStyle.colorPrimary : ColorStyle.colorWhite,
          height: MediaQuery.of(context).padding.top,
        ),
        Container(
          color: isPrimary ? ColorStyle.colorPrimary : ColorStyle.colorWhite,
          height: 88.r,
          child:
              // 普通箭头加标题
              // AppBarA(title: title, isPrimary: isPrimary),
              // 只一个搜索框
              AppBarB(placeholder: placeholder, inputBackDark: inputBackDark),
        ),
      ],
    );
  }
}

//普通箭头加标题
class AppBarA extends StatelessWidget {
  final String title;
  final bool isPrimary;
  AppBarA({this.title = '', this.isPrimary = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
            width: 94.r,
            child: Icon(Icons.arrow_back_ios,
                color:
                    isPrimary ? ColorStyle.colorWhite : ColorStyle.colorTitle)),
        // Image(
        //   width: 34.r,
        //   height: 34.r,
        //   image: NetworkImage(
        //       Domain.domain + 'with_city_left_arrow.png'),
        // )
        Expanded(
            child: Center(
          child: Text(
            title,
            style: TextStyle(
                color:
                    isPrimary ? ColorStyle.colorWhite : ColorStyle.colorTitle,
                fontWeight: FontWeight.w600,
                fontFamily: ColorStyle.fontFamilySc,
                fontSize: 32.sp),
          ),
        )),
        Container(
          width: 94.r,
        ),
      ],
    );
  }
}

//只一个搜索框
class AppBarB extends StatelessWidget {
  final String placeholder; //搜索框默认提示
  final bool inputBackDark; //搜索框背景色是否是深色
  AppBarB({this.placeholder = '', this.inputBackDark = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding:EdgeInsets.only(left:20.r),
        decoration: BoxDecoration(
            color: inputBackDark ? Color(0xfff8f8f8) : ColorStyle.colorWhite,
            borderRadius: BorderRadius.all(Radius.circular(32.r))),
        width: 710.r,
        height: 64.r,
        child: Row(
          children: <Widget>[
            Image.asset('images/appbar_search_icon.png',width: 28.r,height: 28.r),
            SizedBox(width: 6.r),
            Text(placeholder, style: TextStyle(color: Color(0xff999999),fontSize:28.sp))
          ],
        ),
      ),
    );
  }
}

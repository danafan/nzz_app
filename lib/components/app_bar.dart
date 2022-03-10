import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:nzz/basic.dart';

// appbar
class AppBarWidget extends StatelessWidget {
  final String type; //类型（a:普通箭头加标题；b:只一个搜索框）
  final String placeholder; //搜索框默认提示
  final String title; //标题
  final bool isPrimary; //背景色是否是主题色
  final bool inputBackDark; //搜索框背景色是否是深色
  AppBarWidget({
    this.type = 'a',
    this.placeholder = '',
    this.title = '',
    this.isPrimary = true,
    this.inputBackDark = false,
  });

  @override
  Widget build(BuildContext context) {
    //设置状态栏颜色
    // SystemChrome.setSystemUIOverlayStyle(
    //     isPrimary ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);
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
            child: checkAppBar(
                type, placeholder, title, isPrimary, inputBackDark)),
      ],
    );
  }
}

//判断显示哪个appbar
Widget checkAppBar(type, placeholder, title, isPrimary, inputBackDark) {
  Widget _appbar = SizedBox();
  if (type == 'a') {
    //普通箭头加标题
    _appbar = AppBarA(title: title, isPrimary: isPrimary);
  } else if (type == 'b') {
    //只一个搜索框
    _appbar = AppBarB(placeholder: placeholder, inputBackDark: inputBackDark);
  } else if (type == 'c') {
    //箭头、标题、搜索框（首页几个分类页面使用）
    _appbar = AppBarC(
        title: title,
        placeholder: placeholder,
        isPrimary: isPrimary,
        inputBackDark: inputBackDark);
  }
  return _appbar;
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
        GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(width: 74.r, child: backIcon(isPrimary))),
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
          width: 74.r,
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: Row(
        children: <Widget>[
          Expanded(child: inputWidget(inputBackDark, placeholder))
        ],
      ),
    );
  }
}

//箭头、标题、搜索框（首页几个分类页面使用）
class AppBarC extends StatelessWidget {
  final String title; //标题
  final String placeholder; //搜索框默认提示
  final bool isPrimary; //搜索框背景色是否是深色
  final bool inputBackDark; //搜索框背景色是否是深色
  AppBarC(
      {this.title = '',
      this.placeholder = '',
      this.isPrimary = false,
      this.inputBackDark = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 20.r),
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                  padding: EdgeInsets.only(left: 20.r, right: 15.r),
                  child: backIcon(isPrimary)),
            ),
            Text(title,
                style: TextStyle(
                    color: ColorStyle.colorTitle,
                    fontSize: 40.r,
                    fontWeight: FontWeight.bold)),
            SizedBox(width: 15.r),
            Expanded(
              child: inputWidget(inputBackDark, placeholder, false),
            ),
          ],
        ));
  }
}

//左侧箭头
Widget backIcon(isPrimary) {
  return Image.asset(
      isPrimary ? 'images/back_icon_light.png' : 'images/back_icon_dark.png',
      width: 34.r,
      height: 34.r);
}

//输入框
Widget inputWidget(inputBackDark, placeholder, [defaultCircular = true]) {
  return Container(
    padding: EdgeInsets.only(left: 20.r),
    decoration: BoxDecoration(
        color: inputBackDark ? Color(0xfff8f8f8) : ColorStyle.colorWhite,
        borderRadius:
            BorderRadius.all(Radius.circular(defaultCircular ? 32.r : 8.r))),
    height: 64.r,
    child: Row(
      children: <Widget>[
        Image.asset('images/appbar_search_icon.png', width: 28.r, height: 28.r),
        SizedBox(width: 6.r),
        Text(placeholder,
            style: TextStyle(color: Color(0xff999999), fontSize: 28.sp))
      ],
    ),
  );
}

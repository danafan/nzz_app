import 'package:flutter/material.dart';
import 'package:nzz/basic.dart';
import 'package:nzz/components/app_bar.dart';

class FoodPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.colorBackGround,
        body: Column(children: <Widget>[
          AppBarWidget(
            type: 'c',
            title:'同城',
            placeholder: '搜索商品',
            inputBackDark: true,
            isPrimary: false,
          ),
        ]));
  }
}

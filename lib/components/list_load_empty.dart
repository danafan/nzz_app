import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//列表加载中和空状态
class ListLoadEmptyView extends StatelessWidget {

  final bool isEmpty;
  final String toastText;

  ListLoadEmptyView(this.isEmpty,[this.toastText = '空空如也']);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isEmpty?emptyWidget(toastText):loadingWidget(),
    );
  }
}

//空列表
Widget emptyWidget(toastText){
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('images/empty_icon.png',width: 306.r,height: 306.r),
        Text(toastText,style: TextStyle(color: Color(0x66fe3c50),fontSize: 32.r,fontWeight: FontWeight.w400),)
      ],
    ),
  );
}

// 加载中
Widget loadingWidget(){
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('加载中...')
      ],
    ),
  );
}
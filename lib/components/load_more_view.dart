import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//列表底部加载状态组件
class LoadMoreView extends StatelessWidget {
  final bool isLoad;
  LoadMoreView(this.isLoad);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60.r,
      child: isLoad == true
          ? Text('----- 加载中 ------')
          : Text('----- 我是有底线的 ------'),
    );
  }
}

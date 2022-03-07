import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadMoreView extends StatelessWidget {
  final isLoad;
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

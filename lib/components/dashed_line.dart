import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashedLine extends StatelessWidget {
  final Axis axis; // 方向
  final double width; //宽度
  final double height; //高度
  final Color color;
  DashedLine(this.axis, this.height, this.width,this.color);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (_) {
        return SizedBox(
          width: width,
          height: height,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(width)),
          ),
        );
      }),
    );
  }
}

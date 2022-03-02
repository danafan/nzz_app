import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradeStarView extends StatelessWidget {
  //当前分数
  final double score;
  // 尺寸（宽高相等）
  final int size;
  GradeStarView(this.score,{this.size = 40});

  Widget _getGradeStar() {
    List<Widget> _list = [];
    for (var i = 0; i < 5; i++) {
      double factor = (score - i);
      if (factor >= 1) {
        factor = 1.0;
      } else if (factor < 0) {
        factor = 0;
      }
      Widget _st = Container(
        width: size.r,
        height: size.r,
        child: Stack(
          children: <Widget>[
            Image.asset('images/star_dark.png', width: size.r, height: size.r),
            ClipRect(
                child: Align(
              alignment: Alignment.topLeft,
              widthFactor: factor,
              child: Image.asset('images/star_light.png',
                  width: size.r, height: size.r),
            ))
          ],
        ),
      );
      _list.add(_st);
    }
    return Row(
      children: _list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _getGradeStar());
  }
}

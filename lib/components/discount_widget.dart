import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzz/basic.dart';

class DiscountWidget extends StatelessWidget {

  final double discount;
  DiscountWidget(this.discount);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.r, horizontal: 5.r),
      decoration: BoxDecoration(
          color: ColorStyle.colorPrimary,
          borderRadius: BorderRadius.circular(4.r)),
      child: Text(
        '${discount.toString()}折',
        style: TextStyle(color: ColorStyle.colorWhite, fontSize: 18.r),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'routes/index.dart';
import 'basic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1624),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => GetMaterialApp(
          title: "Application",
          initialRoute: AppPages.initialPage,
          getPages: AppPages.routes,
          theme: ThemeData(primaryColor: ColorStyle.colorPrimary)),
    );
  }
}

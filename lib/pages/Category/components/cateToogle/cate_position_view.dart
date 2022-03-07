import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nzz/basic.dart';
import 'package:nzz/controllers/category_controller.dart';
import 'package:nzz/pages/Category/components/cateToogle/cate_toogle_controller.dart';

class CatePositionView extends StatelessWidget {
  //分类controller
  final CategoryController categoryController = Get.find<CategoryController>();
  //分类滑动controller
  final CateToogleController cateToogleController =
      Get.put(CateToogleController());

  @override
  Widget build(BuildContext context) {
    return Container(child:Column(
      children: <Widget>[
        Container(
          height: 90.r,
          color: ColorStyle.colorWhite,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Obx(() => Container(
                      padding: EdgeInsets.only(left: 30.r),
                      child: Text(
                          '${categoryController.leftCurrentTitle.value}分类',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color(0xff989898),
                              fontSize: 28.r,
                              fontWeight: FontWeight.w600))))),
              GestureDetector(
                  onTap: () {
                    categoryController.changeOpenStatus(0);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: 90.r,
                      height: 90.r,
                      child: Image.asset('images/cate_toogle_close.png',
                          width: 38.r, height: 38.r)))
            ],
          ),
        ),
        Container(
          constraints: BoxConstraints(maxHeight: 456.r),
          color: ColorStyle.colorWhite,
          padding: EdgeInsets.symmetric(horizontal: 15.r),
          child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Obx(() => GridView.builder(
                    primary: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //设置列数
                        crossAxisCount: 3,
                        //设置横向间距
                        crossAxisSpacing: 0,
                        //设置主轴间距
                        mainAxisSpacing: 0,
                        childAspectRatio: 185.r / 228.r),
                    scrollDirection: Axis.vertical,
                    itemCount: categoryController.rightCateList.length,
                    itemBuilder: (context, index) {
                      return Container(
                          width: 185.r,
                          height: 228.r,
                          child: Column(
                            children: [
                              Image.network(
                                categoryController.rightCateList[index].pic,
                                width: 155.r,
                                height: 155.r,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 20.r),
                              Container(
                                width: 155.r,
                                child: Text(
                                  categoryController
                                      .rightCateList[index].cateName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorStyle.colorTitle,
                                      fontSize: 24.r,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ));
                    },
                  ))),
        ),
        Expanded(
            child: Container(
          color: Color(0x7f000000),
        ))
      ],
    ));
  }
}

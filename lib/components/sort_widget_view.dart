import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nzz/basic.dart';


//排序组件
class SortWidget extends StatelessWidget {

  final int currentSortIndex; //当前选中的下标
  final List sortList;        //选项列表
  final Function changeSort;  //切换选项的方法
  SortWidget(this.currentSortIndex,this.sortList,this.changeSort);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.r,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 20.r),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var item = sortList[index];
          return GestureDetector(
              onTap: () {
                changeSort(index);
              },
              child: Container(
                  margin: EdgeInsets.only(right: 22.r),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              currentSortIndex == index
                                  ? ColorStyle.colorPrimary
                                  : ColorStyle.colorBackGround),
                      color: currentSortIndex == index
                          ? Color(0x19fe3c50)
                          : ColorStyle.colorBackGround,
                      borderRadius: BorderRadius.circular(24.r)),
                  width: 88.r,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${item['name']}',
                        style: TextStyle(
                            color: currentSortIndex ==
                                    index
                                ? ColorStyle.colorPrimary
                                : ColorStyle.colorText,
                            fontSize: 24.r,
                            fontWeight:
                                currentSortIndex ==
                                        index
                                    ? FontWeight.w600
                                    : FontWeight.w400),
                      ),
                      Offstage(
                          offstage: item['haveIcon'] == false,
                          child: SizedBox(width: 3.r)),
                      Offstage(
                          offstage: item['haveIcon'] == false,
                          child: Image.asset(item['sortIcon'],
                              width: 14.r,
                              height: 21.r)
                              )
                    ],
                  )));
        },
        itemCount: sortList.length,
      ),
    );
  }
}

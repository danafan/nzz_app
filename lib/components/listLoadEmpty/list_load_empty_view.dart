import 'package:flutter/material.dart';

//列表加载中和空状态
class ListLoadEmptyView extends StatelessWidget {

  final isEmpty;

  ListLoadEmptyView(this.isEmpty);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isEmpty?Text('空空如也'):Text('加载中...'),
    );
  }
}
import 'package:flutter/material.dart';

class ShopCar extends StatelessWidget {
  const ShopCar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('购物车')),
      body: Center(
        child:Text('购物车')
      )
    );
  }
}
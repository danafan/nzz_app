import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('消息')),
      body: Center(
        child:Text('消息')
      )
    );
  }
}
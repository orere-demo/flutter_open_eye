import 'package:flutter/material.dart';

class MyPageWidget extends StatefulWidget {
  MyPageWidget({Key? key}) : super(key: key);

  @override
  _MyPageWidgetState createState() => _MyPageWidgetState();
}

class _MyPageWidgetState extends State<MyPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('我的'),
    );
  }
}
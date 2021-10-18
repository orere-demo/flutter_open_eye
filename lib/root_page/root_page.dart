import 'package:flutter/material.dart';
import 'package:demo2_eye/utils/theme.dart';
import 'package:demo2_eye/config/string_config.dart';
import 'package:demo2_eye/view_model/home_view_model/home_tab_view_model.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  HomeTabViewModel _tabViewModel = new HomeTabViewModel(0);
  changeTabIndex(int index) {
    setState(() {
      _tabViewModel.currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(

      ),
      // bottomNavigationBar: ,
    );
  }
}
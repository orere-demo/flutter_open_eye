import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo2_eye/utils/theme.dart';
import 'package:demo2_eye/config/string_config.dart';
import 'package:demo2_eye/view_model/home_view_model/home_tab_view_model.dart';
import 'package:demo2_eye/provider/provider_widget.dart';

import 'package:demo2_eye/root_page/home_page/home_page_widget.dart';
import 'package:demo2_eye/root_page/my_page/my_page_widget.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        reverse: true,
        controller: pageController,
        children: [
          // 首页
          HomePageWidget(),
          // 我的
          MyPageWidget()
        ],
      ),
      bottomNavigationBar: ProviderWidget<HomeTabViewModel>(
        model: HomeTabViewModel(),
        builder: (context, model, child){
          return BottomNavigationBar(
            currentIndex: model.currentIndex,
              selectedItemColor: themeColor(),
              unselectedItemColor: Color(0xff9a9a9a),
              onTap: (index){
                pageController.jumpToPage(index);
                model.changeBottomTabIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), activeIcon: Icon(Icons.home, color: themeColor()), label: '首页'),
                BottomNavigationBarItem(icon: Icon(Icons.android), activeIcon: Icon(Icons.android, color: themeColor()), label: '我的'),
              ]
          );
        },
      ),
    );
  }
}
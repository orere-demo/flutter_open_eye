import 'package:demo2_eye/config/color_config.dart';
import 'package:flutter/material.dart';
import 'package:demo2_eye/root_page/home_page/home_body_page_widget.dart';
import 'package:demo2_eye/utils/util.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

// AutomaticKeepAliveClientMixin，使
class _HomePageWidgetState extends State<HomePageWidget> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: appBar('首页', backgroundColor: ColorConfig.themeColor),
      body: HomeBodyPageWidget(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
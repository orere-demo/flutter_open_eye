import 'package:demo2_eye/provider/provider_widget.dart';
import 'package:demo2_eye/utils/loading_state_widget_util.dart';
import 'package:flutter/material.dart';
import 'package:demo2_eye/view_model/home_view_model/home_body_view_model.dart';
import 'package:demo2_eye/config/string_config.dart';

class HomeBodyPageWidget extends StatefulWidget {
  HomeBodyPageWidget({Key? key}) : super(key: key);

  @override
  _HomeBodyPageWidgetState createState() => _HomeBodyPageWidgetState();
}

class _HomeBodyPageWidgetState extends State<HomeBodyPageWidget> {
  // bannerList
  // videoList
  // 分页
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<HomeBodyViewModel>(
        model: HomeBodyViewModel(),
        onModelInit: (model) => model.requestHttpData(),
        builder: (context, model, child){
          return Container(
            child: Text('123'),
          );
          // return LoadingWidget(
          //   type: model.type,
          //     child: Container(),
          //     reload: model.requestHttpData);
        }
    );
  }
}
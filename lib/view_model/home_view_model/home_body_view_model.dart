import 'package:demo2_eye/base/base_change_notifier.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/cupertino.dart';

class ItemList {
  // String _type;

}

class HomeBodyViewModel extends BaseChangeNotifier {
  List bannerList = [];
  List videoList = [];

  // 控制器
  RefreshController refreshController = RefreshController(initialRefresh: false);

}
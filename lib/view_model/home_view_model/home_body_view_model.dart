import 'package:demo2_eye/base/base_change_notifier.dart';
import 'package:demo2_eye/http/http_manager.dart';
import 'package:demo2_eye/http/http_response.dart';
import 'package:demo2_eye/utils/loading_state_widget_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:demo2_eye/config/url_config.dart';
import 'dart:convert';
import 'package:demo2_eye/bean/home_body_bean.dart' as home_body_bean;
import 'package:demo2_eye/utils/loading_state_widget_util.dart';

class ItemList {
  // String _type;

}

class HomeBodyViewModel extends BaseChangeNotifier {
  List<home_body_bean.ItemList> bannerList = [];
  List<home_body_bean.ItemList> videoList = [];
  int count = 0;

  late String nextPageUrl;

  // 控制器
  RefreshController refreshController = RefreshController(initialRefresh: false);

  void loadMore() async {
    print('loadMore');
    await HttpResponse.get(nextPageUrl);
  }

  // 请求网络数据 / 下拉刷新 / feedUrl

  // 请求数据 bannerList(页面刷新)， 第一页 是 bannerList 的数据
  void requestHttpData() async{
    // type = LoadingWidget.LOADING;
    videoList.clear();
    bannerList.clear();
    var data = await HttpResponse.get(UrlConfig.feedUrl);
    type = LoadingWidget.DONE;

    var bean = home_body_bean.HomeBodyBean.fromJson(data);

    buildBannerList(bean);

    // 请求下一页
    nextPageUrl = bean.nextPageUrl!;
    requestHttpHomeBodyVideo();

    notifyListeners();
  }

  // 请求列表数据 videoList
  void requestHttpHomeBodyVideo() async{
    var data = await HttpResponse.get(nextPageUrl);
    type = LoadingWidget.DONE;
    var bean = home_body_bean.HomeBodyBean.fromJson(data);

    videoList.addAll(bean.issueList[0].itemList);

    notifyListeners();
  }

  // banner数据
  void buildBannerList(home_body_bean.HomeBodyBean bean){
    bean.issueList[0].itemList.forEach((element){
      if(element.type!='banner2' && element.data!=null && element.data!.cover !=null){
        bannerList.add(element);
      }
    });
  }

  void changeCount(){
    count++;
    notifyListeners();
  }
}
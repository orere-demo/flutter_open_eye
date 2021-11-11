import 'package:demo2_eye/base/base_change_notifier.dart';
import 'package:demo2_eye/http/http_manager.dart';
import 'package:demo2_eye/utils/loading_state_widget_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:demo2_eye/config/url_config.dart';


class ItemList {
  // String _type;

}

class HomeBodyViewModel extends BaseChangeNotifier {
  List bannerList = [];
  List videoList = [];

  // 控制器
  RefreshController refreshController = RefreshController(initialRefresh: false);

  // 请求网络数据 / 下拉刷新
  void requestHttpData() async{
    type = LoadingWidget.LOADING;
    videoList.clear();
    bannerList.clear();

    var data = await Request.get(UrlConfig.feedUrl);

    print('-------------------------------$data---------------------------------');
  }
}
import 'package:demo2_eye/provider/provider_widget.dart';
import 'package:demo2_eye/utils/loading_state_widget_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo2_eye/view_model/home_view_model/home_body_view_model.dart';
import 'package:demo2_eye/config/string_config.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:demo2_eye/root_page/home_page/home_banner_page_widget.dart';

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
          // return Container(
          //   child: Text('123'),
          // );
          return LoadingWidget(
            type: model.type,
            reload: model.requestHttpData,
            child:
            Container(
                child: SmartRefresher(
                  footer: CustomFooter(
                      builder: (BuildContext context, LoadStatus? mode){
                        Widget body;
                        if (mode == LoadStatus.idle) {
                          body = Text("上拉加载中~~");
                        } else if (mode == LoadStatus.loading) {
                          body = CupertinoActivityIndicator();
                        } else if (mode == LoadStatus.failed) {
                          body = Text("加载失败！点击重试！");
                        } else if (mode == LoadStatus.canLoading) {
                          body = Text("松手,加载更多!");
                        } else {
                          body = Text("没有更多数据了!");
                        }
                        return Container(
                          height: 55.0,
                          child: Center(child: body),
                        );
                      }
                  ),
                  controller: model.refreshController,
                  // 下拉刷新
                  onRefresh: model.requestHttpData,
                  // 上拉加载更多
                  onLoading: model.loadMore,
                  // 允许下拉
                  enablePullDown: true,
                  enablePullUp: true,
                  child: ListView.separated(
                    // 列表项构造器
                      itemBuilder: (BuildContext context, int index){
                        Widget widget;
                        if(index == 0){
                          return widget = HomeBannerPageWidget(
                            bannerList: model.bannerList,
                          );
                        }
                        // if(model.videoList[index]){
                        return Column(
                          children: [
                            ElevatedButton(onPressed: model.changeCount, child: Text('加1')),
                            Text('${model.count}'),
                          ],
                        );
                        // }

                        // return InkWell();
                      },
                      // 分割器构造器
                      separatorBuilder: (BuildContext context, int index ){
                        return Container(
                          alignment: Alignment.center,
                          color: Colors.red,
                        );
                      },
                      itemCount: model.videoList.length
                  ),
                )
            )

          );
        }
    );
  }
}
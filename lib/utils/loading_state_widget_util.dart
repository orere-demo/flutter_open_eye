import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 封装LoadingWidget
// 作为父组件包裹其他组件，在合适的时候显示child内容或者loading图标
// 出错后可以重新请求加载
class LoadingWidget extends StatelessWidget{
  static const LOADING = 0;
  static const DONE = 1;
  static const ERROR = 2;

  // 0: 成功；1完成并停止；2错误
  int type = 0;

  Widget child;

  Function reload;

  LoadingWidget({Key? key, this.type = LOADING, required this.child, required this.reload }) : super(key:key)

  @override
  Widget build(BuildContext context) {
    if(type == LOADING){
      return loading();
    } else if(type == DONE){
      return child;
    }else if(type == ERROR){
      return error();
    }else{
      return child;
    }
  }
}

Widget loading(){
  return Center(
    // CupertinoActivityIndicator 风格组件的Loading组件
    child: CupertinoActivityIndicator(
      // animating 是否执行动画
      animating: true,
      // radius 动画的大小
      radius: 30
    ),
  );
}

// 请求出错 重新加载
Widget error(){
  return Center(
    child: Column(
      children: [
        Icon(Icons.sentiment_dissatisfied_outlined),
        Text('请求网络失败了!'),

      ],
    ),
  );
}
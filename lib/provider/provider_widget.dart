import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 借助ChangeNotifier实现发布者-订阅者模式
// notifyListeners 告知听众刷新
// class UserInfoModel with ChangeNotifier{... notifyListeners() }

// ChangeNotifierProvider.value 管理数据状态，放在公共父组件的位置
// ChangeNotifierProvider.value(value: UserInfoModel()),
// 管理多个 MultiProvider
// return MultiProvider(providers:[
//   ChangeNotifierProvider.value(value: UserInfoModel()),
//   ChangeNotifierProvider.value(value: UserLocationModel())
// ], child: MaterialApp(...))
// 管理多个 Consumer
// child: Consumer2<UserInfoModel, UserLocationModel>()


class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget{
  @override
  _ProviderWidgetState createState() => _ProviderWidgetState();
}

class _ProviderWidgetState extends State{
  Widget build(BuildContext context){
    return Text('123');
  }
}
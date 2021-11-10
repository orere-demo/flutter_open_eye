import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Model 借助ChangeNotifier实现发布者-订阅者模式
// notifyListeners 告知听众刷新
// class UserInfoModel with ChangeNotifier{... notifyListeners() }

// 使用ChangeNotifierProvider将Model和Widget相关联
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
  final T model;
  final Widget? child;
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelInit;

  const ProviderWidget({
    Key? key,
    required this.model,
    required this.builder,
    this.child,
    this.onModelInit,
  }):super(key: key);

  @override
  _ProviderWidgetState createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends ChangeNotifier> extends State<ProviderWidget<T>>{
  late T model;

  @override
  void initState(){
    super.initState();
    model = widget.model;
    if(widget.onModelInit != null ){
      widget.onModelInit!(model);
    }
  }

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
        create: (_) => model,
        child: Consumer(
      builder: widget.builder,
      child: widget.child
    ));
  }
}
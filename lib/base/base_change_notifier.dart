import 'package:flutter/material.dart';

// 状态管理的数据，都需要混入ChangeNotifier方法，并通过notifyListeners告知听众

// 包一层ChangeNotifier， 当页面销毁的时候，不刷新页面
class BaseChangeNotifier with ChangeNotifier{
  bool _dispose = false;

  @override
  void dispose(){
    this._dispose = true;
    super.dispose();
  }

  @override
  void notifyListeners(){
    // 当页面销毁的时候，不刷新页面
    if(!_dispose){
      super.notifyListeners();
    }
  }
}
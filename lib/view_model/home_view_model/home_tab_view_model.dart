import 'package:flutter/material.dart';
import 'package:demo2_eye/base/base_change_notifier.dart';

class HomeTabViewModel extends BaseChangeNotifier {
  int currentIndex = 0;
  void changeBottomTabIndex(int index){
    currentIndex = index;
    // 刷新數據
    notifyListeners();
  }
  // HomeTabViewModel(this.currentIndex);
}
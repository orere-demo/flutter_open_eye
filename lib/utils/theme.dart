import 'package:flutter/material.dart';
import 'package:demo2_eye/config/color_config.dart';

//主题色
Color themeColor(){
  return ColorConfig.themeColor == Colors.white ? Colors.black : ColorConfig.themeColor;
}
import 'package:demo2_eye/config/color_config.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBar(String title, {Color? backgroundColor}){
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.black
      ),
    ),
    backgroundColor: backgroundColor
  );
}
// , Color backgroundColor
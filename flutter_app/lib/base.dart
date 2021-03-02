

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Base  {

  static final defaultColor = Color(0xffff5d23);
  // 初始化设计稿尺寸
  static final double dessignWidth = 375.0;
  static final double dessignHeight = 1335.0;

  static final double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;

  num dp(double dessignValue) => ScreenUtil.getInstance().setWidth(dessignValue);
}
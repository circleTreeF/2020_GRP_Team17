

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/login/login_screen.dart';

import 'utils/app_theme.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // 强制竖屏
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Route<dynamic> _getRoute(RouteSettings settings) {
    Map<String, WidgetBuilder> routes = {
      '/': (BuildContext context) => LoginScreen(),
    };
    var widget = routes[settings.name];

    if (widget != null) {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: widget,
      );
    }

    return null;
  }
  @override
  Widget build(BuildContext context) {



    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    //默认隐藏底部虚拟状态栏(需手机支持虚拟状态栏设备)，即三大金刚键；获取焦点后展示状态栏，展示大小为去掉状态栏时整体大小；
    return MaterialApp(
      title: 'Road Monitoring',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      // home: NavigationHomeScreen(),//进入程序后显示的第一个页面
      onGenerateRoute: _getRoute,
    );
  }
}
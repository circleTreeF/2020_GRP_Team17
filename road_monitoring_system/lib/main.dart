

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:road_monitoring_system/login/view/register_fail_page.dart';


import 'about_us/about_us.dart';
import 'driving/view/driving_screen.dart';
import 'history_data/view/history_data_screen.dart';
import 'home/home_screen.dart';
import 'login/view/login_screen.dart';
import 'login/view/register_screen.dart';
import 'home/navigation_home_screen.dart';
import 'utils/app_theme.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  ///lock screen Orientation.
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ])  .then((_) { runApp(MyApp()); });

}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      initialRoute: '/', //Start the app with the "/" named route.

      title: 'Road Monitoring app',

      debugShowCheckedModeBanner: false, //remove the debug label

      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: _getRoutePath,
    );
  }


  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/1/21 7:42 PM
  *** @version:2.0
  **/
  ///match the route with the path
  Route<dynamic> _getRoutePath(RouteSettings settings) {
    Map<String, WidgetBuilder> routes = {
      // When navigating to the "/" route, build the LoginScreen widget.
      '/': (BuildContext context) => LoginScreen(),
      // When navigating to the "/register" route, build the RegisterScreen widget.
      '/register': (BuildContext context) => RegisterScreen(),
      // When navigating to the "/register_fail" route, build the PopUpPageForRegisterFail widget.
      '/register_fail': (BuildContext context) => PopUpPageForRegisterFail(),
      // When navigating to the "/navigation" route, build the NavigationHomeScreen widget.
      '/navigation': (BuildContext context) => NavigationHomeScreen(),
      // When navigating to the "/about_us" route, build the AboutUs widget.
      '/about_us': (BuildContext context) => AboutUs(),
      // When navigating to the "/history" route, build the HistoryDataScreen widget.
      '/history': (BuildContext context) => HistoryDataScreen(),
      // When navigating to the "/driving" route, build the DrivingScreen widget.
      '/driving': (BuildContext context) => DrivingScreen(),
      // When navigating to the "/home" route, build the HomeScreen widget.
      '/home': (BuildContext context) => HomeScreen(),
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
}
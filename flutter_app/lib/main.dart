

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/about_us.dart';
import 'package:flutter_app/login/login_screen.dart';
import 'package:flutter_app/login/register.dart';
import 'package:flutter_app/register_fail_page.dart';

import 'driving/driving_screen.dart';
import 'history_data/history_data_search.dart';
import 'home_screen.dart';
import 'navigation_home_screen.dart';
import 'utils/app_theme.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  ///lock screen Orientation.
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ])  .then((_) { runApp(MyApp()); });

 // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
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
      initialRoute: '/',

      title: 'Road Monitoring app',//Start the app with the "/" named route.
      debugShowCheckedModeBanner: false, //remove the debug label

      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        platform: TargetPlatform.iOS,
      ),
      onGenerateRoute: _getRoutePath,
    );
  }


}

///match the route with the path
Route<dynamic> _getRoutePath(RouteSettings settings) {

  Map<String, WidgetBuilder> routes = {
    // When navigating to the "/" route, build the LoginScreen widget.
    '/': (BuildContext context) => LoginScreen(),
    // When navigating to the "/register" route, build the RegisterScreen widget.
    '/register': (BuildContext context) => RegisterScreen(),
    // When navigating to the "/register_fail" route, build the PopUpPageForRegisterFail widget.
    '/register_fail' : (BuildContext context)=> PopUpPageForRegisterFail(),
    // When navigating to the "/navigation" route, build the NavigationHomeScreen widget.
    '/navigation': (BuildContext context) => NavigationHomeScreen(),
    // When navigating to the "/about_us" route, build the AboutUs widget.
    '/about_us' :(BuildContext context) => AboutUs(),
    // When navigating to the "/history" route, build the HistoryDataScreen widget.
    '/history': (BuildContext context) => HistoryDataScreen(),
    // When navigating to the "/driving" route, build the DrivingScreen widget.
    '/driving': (BuildContext context) =>DrivingScreen(),
    // When navigating to the "/home" route, build the HomeScreen widget.
    '/home': (BuildContext context) =>HomeScreen(),
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
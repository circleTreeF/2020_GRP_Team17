
import 'package:flutter/material.dart';
import 'package:road_monitoring_system/home/widgets/drawer.dart';
import 'package:road_monitoring_system/home/widgets_controller/drawerController.dart';


import '../about_us/about_us.dart';
import '../utils/app_theme.dart';
import 'home_screen.dart';

///[NavigationHomeScreen] describes the navigation bar.
///
/// [HomeScreen] the screen display the data collected
/// [AboutUs] the screen contains the information of our team.
class NavigationHomeScreen extends StatefulWidget {
  @override
  NavigationHomeScreenState createState() {
    return NavigationHomeScreenState();
  }

}

///The state of NavigationHomeScreen 
class NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    ///set the screen to the [HomeScreen] initially
    screenView = HomeScreen();
    super.initState();
  }

  /// build method for UI rendering
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.whiteExtent1,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.whiteExtent1,
          body: DrawerWidgetController(
            index: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexData) {
              changeDrawerIndex(drawerIndexData);
            },
            screen: screenView,
          ),
        ),
      ),
    );
  }


  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/12 5:17 PM
  *** @version:1.0
  **/
  ///Change the screen by the drawer index.
  void changeDrawerIndex(DrawerIndex drawerIndexData) {
    if (drawerIndex != drawerIndexData) {
      drawerIndex = drawerIndexData;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView =  HomeScreen();
        });
      }

      if (drawerIndex == DrawerIndex.ABOUT) {
        setState(() {
          screenView =  AboutUs();
        });
      }



      }

      }
    }


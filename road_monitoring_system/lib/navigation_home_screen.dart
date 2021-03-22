
import 'package:flutter/material.dart';
import 'package:road_monitoring_system/widgets/drawer.dart';
import 'package:road_monitoring_system/widgets_controller/drawerController.dart';


import 'about_us.dart';
import 'utils/app_theme.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
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



import 'package:flutter/material.dart';
import 'package:flutter_app/score_screen.dart';
import 'package:flutter_app/widgets/drawer.dart';
import 'package:flutter_app/widgets_controller/drawerController.dart';

import 'about_us.dart';
import 'utils/app_theme.dart';
import 'home_screen.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}


class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
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
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexData) {
              changeIndex(drawerIndexData);
            },
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexData) {
    if (drawerIndex != drawerIndexData) {
      drawerIndex = drawerIndexData;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView =  HomeScreen();
        });
      }

      if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView =  AboutUs();
        });
      }

      if (drawerIndex == DrawerIndex.Share) {
        setState(() {
          screenView =  Score();
        });
      }


      }

      }
    }


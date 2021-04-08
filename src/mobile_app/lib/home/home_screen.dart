
import 'package:flutter/material.dart';
import 'package:road_monitoring_system/home/widgets/bottom_bar.dart';
import 'package:road_monitoring_system/utils/bottom_bar_icon.dart';


import '../utils/app_theme.dart';
import '../driving/view/driving_screen.dart';
import '../history_data/view/history_data_screen.dart';


///This class defines the home screen of this app
///consisting of the body of the screen,such as driving screen, and the bottom bar of this app.
class HomeScreen extends StatefulWidget {
  @override

  HomeScreenState createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

///The state of this home page.
class HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  ///The list of icon on the bottom bar
  List<BottomBarIcon> bottomIconsList = BottomBarIcon.iconList;

  ///The body of this screen
  Widget screenBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {

    bottomIconsList.forEach((BottomBarIcon icon) {
      icon.isSelected = false;
    });//initializes all the bottom icon is not being selected.



    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    screenBody = DrivingScreen();//initializes the body of this homeScreen as the screen used to ask for permission.

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  /// build method for UI rendering
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  screenBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }


  /** 
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/2/16 6:30 PM
  *** @version:1.2
  **/

  ///Returns the bottom bar that contains two icons.
  ///
  /// if index equals to 0, the body of this [HomeScreen] is [DrivingScreen];
  /// if index equals to 1, the body of this [HomeScreen] is [HistoryDataScreen];
  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBar(
          bottomBarIconList: bottomIconsList,
          changeIndex: (int index) {
            if (index == 0) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  screenBody = DrivingScreen();
                });
              });
            }else if(index == 1){
                animationController.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    screenBody =  HistoryDataScreen();
                  });
                });
              }

          },
        ),
      ],
    );
  }
}

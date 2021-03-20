
import 'package:flutter/material.dart';
import 'package:road_monitoring_system/utils/Icon_info.dart';
import 'package:road_monitoring_system/widgets/bottom_bar.dart';


import 'utils/app_theme.dart';
import 'driving/driving_screen.dart';
import 'history_data/history_data_search.dart';

class HomeScreen extends StatefulWidget {
  @override

  HomeScreenState createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  List<IconList> tabIconsList = IconList.iconList;

  Widget tabBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {

    tabIconsList.forEach((IconList tab) {
      tab.isSelected = false;
    });

    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    tabBody = DrivingScreen(animationController: animationController);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

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
                  tabBody,
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



  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBar(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = DrivingScreen(animationController: animationController);
                });
              });
            }else if(index == 1){
                animationController.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody =  HistoryDataScreen();
                  });
                });
              }

          },
        ),
      ],
    );
  }
}

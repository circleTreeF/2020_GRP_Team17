
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/Icon_info.dart';
import 'package:flutter_app/widgets/bottom_bar_view.dart';

import 'UI/app_theme.dart';
import 'driving_screen.dart';
import 'history_data/history_data_search.dart';
import 'info_page.dart';
import 'last_known_location_example_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  List<IconList> tabIconsList = IconList.iconList;

  Widget tabBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {
    //底部菜单栏
    tabIconsList.forEach((IconList tab) {
      tab.isSelected = false;
    });
    //先将第一个页面选中
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


  //底部菜单栏。
  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
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
            }else if(index== 1){

                animationController.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody =  HistoryDataScreen();
                  });
                });
              }
            else if (index == 2 || index == 3) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =InfoPage();
                });
              });
            }
          },
        ),
      ],
    );
  }
}

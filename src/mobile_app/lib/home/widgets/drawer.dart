import 'package:flutter/material.dart';
import 'package:road_monitoring_system/login/view/login_screen.dart';
import 'package:road_monitoring_system/login/model/user_account.dart';
import 'package:road_monitoring_system/utils/app_theme.dart';
import 'package:road_monitoring_system/utils/constant.dart';



///The widget contains the user profile and [HOME] : the driving screen and [ABOUT] : the about us screen.

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key key, this.index, this.iconAnimationController, this.navigateIndex}) : super(key: key);
///The controller for an animation of the icon.
  final AnimationController iconAnimationController;
  ///The index of drawer
  final DrawerIndex index;

  
  final Function(DrawerIndex) navigateIndex;

  @override
  HomeDrawerState createState() => HomeDrawerState();
}

class HomeDrawerState extends State<HomeDrawer> {
  ///The list of the contents of the drawer index
  List<DrawerIndexContents> drawerIndexList;
  @override
  void initState() {
    setDrawerList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: widget.iconAnimationController,
                    builder: (BuildContext context, Widget child) {
                      return ScaleTransition(
                        scale: AlwaysStoppedAnimation<double>(1.0 - (widget.iconAnimationController.value) * 0.2),
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation<double>(Tween<double>(begin: 0.0, end: 24.0)
                              .animate(CurvedAnimation(parent: widget.iconAnimationController, curve: Curves.fastOutSlowIn))
                              .value /
                              360),
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(color: AppTheme.grey.withOpacity(0.6), offset: const Offset(2.0, 4.0), blurRadius: 8),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(60.0)),
                              child: Image.asset('assets/images/logo.png'),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18, left: 18),
                    child: Text(
                      "${UserAccount().username}",
                      style: userNameTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Divider(
            height: 1,
            color: AppTheme.grey.withOpacity(0.6),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0.0),
              itemCount: drawerIndexList.length,
              itemBuilder: (BuildContext context, int index) {
                return inkwell(drawerIndexList[index]);
              },
            ),
          ),
          Divider(
            height: 1,
            color: AppTheme.grey.withOpacity(0.6),
          ),
          Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Sign Out',
                  style: signOutTextStyle,
                  textAlign: TextAlign.left,
                ),
                trailing: Icon(
                  Icons.power_settings_new,
                  color: Colors.red,
                ),
                onTap: () {
                  UserAccount().user_id=null;
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context)=>LoginScreen()
                      )
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget inkwell(DrawerIndexContents drawerList) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          goToScreen(drawerList.index);
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 7.0,
                    height: 45.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  Icon(drawerList.icon.icon, color: widget.index == drawerList.index ? Colors.blue : AppTheme.blackExtent1),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  Text(
                    drawerList.labelName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: widget.index == drawerList.index ? Colors.blue : AppTheme.blackExtent1,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            widget.index == drawerList.index
                ? AnimatedBuilder(
              animation: widget.iconAnimationController,
              builder: (BuildContext context, Widget child) {
                return Transform(
                  transform: Matrix4.translationValues(
                      (MediaQuery.of(context).size.width * 0.73 - 61) * (1.0 - widget.iconAnimationController.value - 1.0), 0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.73 - 61,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  
  /** 
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/12 6:10 PM
  *** @version:1.0
  **/
  ///Navigates to the screen that the index represents.
  Future<void> goToScreen(DrawerIndex index) async {
    widget.navigateIndex(index);
  }


  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/3 5:55 PM
  *** @version:1.0
  **/
  ///Sets the list of drawer's index.
  void setDrawerList() {
    drawerIndexList = <DrawerIndexContents>[
      DrawerIndexContents(
        index: DrawerIndex.HOME,
        labelName: 'Home',
        icon: Icon(Icons.home),
      ),
      DrawerIndexContents(
        index: DrawerIndex.ABOUT,
        labelName: 'About us',
        icon: Icon(Icons.person),
      ),
    ];
  }
}


/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/3/3 5:55 PM
*** @version:1.0
**/

///Enums of the drawerIndex
enum DrawerIndex {
  HOME,
  ABOUT,
}


/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/3/3 5:55 PM
*** @version:1.0
**/

///[DrawerIndexContents] describes the contents of one index of the drawer.
class DrawerIndexContents {
  DrawerIndexContents({
    this.labelName = '',
    this.icon,
    this.index,
  });

  ///The name labelled on this drawer index
  String labelName;
  ///The icon of this drawer index
  Icon icon;
  ///The drawer index
  DrawerIndex index;
}




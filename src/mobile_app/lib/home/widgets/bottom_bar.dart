
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:road_monitoring_system/utils/app_theme.dart';
import 'package:road_monitoring_system/utils/bottom_bar_icon.dart';



///This class describes the stateful bottom navigation bar.
class BottomBar extends StatefulWidget {
  const BottomBar({Key key, this.bottomBarIconList, this.changeIndex})
      : super(key: key);

  ///Change the index of the icon.
  final Function(int index) changeIndex;
  ///The list of the icons on bottom bar.
  final List<BottomBarIcon> bottomBarIconList;

  @override
  BottomBarState createState() => BottomBarState();
}


///This class describes the state of this bottom navigation bar widget.
class BottomBarState extends State<BottomBar> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child) {
            return Transform(
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              child: PhysicalShape(
                color: AppTheme.white,
                elevation: 15.0,
                clipper: MyClipper(
                    radius: Tween<double>(begin: 0.0, end: 1.0)
                        .animate(CurvedAnimation(
                        parent: animationController,
                        curve: Curves.fastOutSlowIn))
                        .value *
                        36.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 8, right: 8, top: 4),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: BottomBarIcons(
                                  bottomBarIcon: widget.bottomBarIconList[0],
                                  removeAllSelect: () {
                                    setRemoveAllSelection(
                                        widget.bottomBarIconList[0]);
                                    widget.changeIndex(0);
                                  }),
                            ),
                            Expanded(
                              child: BottomBarIcons(
                                  bottomBarIcon: widget.bottomBarIconList[1],
                                  removeAllSelect: () {
                                    setRemoveAllSelection(
                                        widget.bottomBarIconList[1]);
                                    widget.changeIndex(1);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).padding.bottom,
                    // )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }


  void setRemoveAllSelection(BottomBarIcon bottomBarIcon) {
    if (!mounted) return;
    setState(() {
      widget.bottomBarIconList.forEach((BottomBarIcon icon) {
        icon.isSelected = false;
        if (bottomBarIcon.index == icon.index) {
          icon.isSelected = true;
        }
      });
    });
  }
}


///This class describes the icons on the bottom bar.
class BottomBarIcons extends StatefulWidget {
  const BottomBarIcons({Key key, this.bottomBarIcon, this.removeAllSelect})
      : super(key: key);

  final BottomBarIcon bottomBarIcon;
  final Function removeAllSelect;

  @override
  BottomBarIconsState createState() => BottomBarIconsState();
}

///This class is the state of the icons on the bottom bar.
class BottomBarIconsState extends State<BottomBarIcons> with TickerProviderStateMixin {
  @override
  void initState() {
    widget.bottomBarIcon.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        if (!mounted) return;
        widget.removeAllSelect();
        widget.bottomBarIcon.animationController.reverse();
      }
    });
    super.initState();
  }

  void setAnimation() {
    widget.bottomBarIcon.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Center(
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            if (!widget.bottomBarIcon.isSelected) {
              setAnimation();
            }
          },
          child: IgnorePointer(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                ScaleTransition(
                  alignment: Alignment.center,
                  scale: Tween<double>(begin: 0.88, end: 1.0).animate(
                      CurvedAnimation(
                          parent: widget.bottomBarIcon.animationController,
                          curve:
                          Interval(0.1, 1.0, curve: Curves.fastOutSlowIn))),
                  child: Icon(widget.bottomBarIcon.isSelected
                      ? widget.bottomBarIcon.iconIsSelected
                      : widget.bottomBarIcon.icon),
                ),
                Positioned(
                  top: 4,
                  left: 6,
                  right: 0,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: widget.bottomBarIcon.animationController,
                            curve: Interval(0.2, 1.0,
                                curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppTheme.blueExtent1,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 6,
                  bottom: 8,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: widget.bottomBarIcon.animationController,
                            curve: Interval(0.5, 0.8,
                                curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppTheme.blueExtent1,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 8,
                  bottom: 0,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: widget.bottomBarIcon.animationController,
                            curve: Interval(0.5, 0.6,
                                curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: AppTheme.blueExtent1,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///
class MyClipper extends CustomClipper<Path> {
  MyClipper({this.radius = 38.0});

  final double radius;

  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.lineTo(0, 0);
    path.arcTo(Rect.fromLTWH(0, 0, radius, radius), degreeToRadians(180),
        degreeToRadians(90), false); //left side arc of bottom bar

    path.arcTo(Rect.fromLTWH(size.width - radius, 0, radius, radius),
        degreeToRadians(270), degreeToRadians(90), false);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(MyClipper oldClipper) => true;

  double degreeToRadians(double degree) {
    final double redian = (math.pi / 180) * degree;
    return redian;
  }
}

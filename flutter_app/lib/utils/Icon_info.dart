



import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


class IconList {
  IconList({
    this.index = 0,
    this.icon,
    this.iconSeleted,
    this.isSelected = false,
    this.animationController,
  });

   IconData icon;
   IconData iconSeleted;

  bool isSelected;
  int index;

  AnimationController animationController;

  static List<IconList> iconList = <IconList>[
    IconList(
      icon:Icons.drive_eta,
      iconSeleted: Icons.drive_eta_sharp,
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    IconList(
      icon:Icons.history,
      iconSeleted: Icons.history_rounded,
      index: 1,
      isSelected: false,
      animationController: null,
    ),
  ];
}

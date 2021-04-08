import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

///The class describes the bottom bar icon widget on the bottom navigation bar.
class BottomBarIcon {
  BottomBarIcon({
    this.index = 0,
    this.icon,
    this.iconIsSelected,
    this.isSelected = false,
    this.animationController,
  });
  ///The icon's appearance.
   IconData icon;
   ///The icon's appearance after selected
   IconData iconIsSelected;
   /// Determined by whether the icon is selected
   bool isSelected;
   ///The index of the icon in the iconList.
   int index;

  AnimationController animationController;

  ///The list of iconList
  static List<BottomBarIcon> iconList = <BottomBarIcon>[
    BottomBarIcon(
      icon:Icons.drive_eta,
      iconIsSelected: Icons.drive_eta_sharp,
      index: 0,
      isSelected: false,
      animationController: null,
    ),
    BottomBarIcon(
      icon:Icons.history,
      iconIsSelected: Icons.history_rounded,
      index: 1,
      isSelected: false,
      animationController: null,
    ),
  ];
}

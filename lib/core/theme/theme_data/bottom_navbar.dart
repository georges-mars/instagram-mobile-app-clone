import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class BottomNavbarThemeData {
  BottomNavbarThemeData._();

  static BottomNavigationBarThemeData lightBottomNavbar =
      BottomNavigationBarThemeData(
        backgroundColor: kAppBarLightColor,
        selectedIconTheme: IconThemeData(color: kIconDarkColor, size: 30.0),
        unselectedIconTheme: IconThemeData(
          color: kIconSecondaryColor,
          size: 30.0,
        ),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      );

  static BottomNavigationBarThemeData darkBottomNavbar = BottomNavigationBarThemeData(
      backgroundColor: kAppBarDarkColor,
      selectedIconTheme: IconThemeData(color: kIconDarkColor, size: 30.0),
      unselectedIconTheme: IconThemeData(color: kIconSecondaryColor, size: 30.0),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
}

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'theme_data/appbar_theme.dart';
import 'theme_data/bottom_navbar.dart';
import 'theme_data/text_btn_theme.dart';
import 'theme_data/text_theme.dart';

class InstagramAppCloneAppTheme {
  InstagramAppCloneAppTheme._();

  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    appBarTheme: AppbarTheme.lightAppBarTheme,
    bottomNavigationBarTheme: BottomNavbarThemeData.lightBottomNavbar,
    colorScheme: ColorScheme.dark(primary: kPrimaryColor),
    iconTheme: IconThemeData(color: kIconDarkColor),
    inputDecorationTheme: InputDecorationThemeData(
      fillColor: kTextFieldFillLightColor,
    ),
    scaffoldBackgroundColor: kScaffoldBgLightColor,
    textButtonTheme: TextBtnTheme.textBtnStyle,
    textTheme: InstagramCloneAppTextTheme.lightTextTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    appBarTheme: AppbarTheme.darkAppBarTheme,
    bottomNavigationBarTheme: BottomNavbarThemeData.darkBottomNavbar,
    colorScheme: ColorScheme.dark(primary: kPrimaryColor),
    iconTheme: IconThemeData(color: kIconLightColor),
    inputDecorationTheme: InputDecorationThemeData(
      fillColor: kTextFieldFillDarkColor,
    ),
    scaffoldBackgroundColor: kScaffoldBgDarkColor,
        textButtonTheme: TextBtnTheme.textBtnStyle,
    textTheme: InstagramCloneAppTextTheme.darkTextTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

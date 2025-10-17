import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppbarTheme {
  AppbarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: kAppBarLightColor,
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: kAppBarDarkColor,
  );
}

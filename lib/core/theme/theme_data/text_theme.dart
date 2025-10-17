import 'package:flutter/material.dart';

import '../../constants/colors.dart';


class InstagramCloneAppTextTheme {
  InstagramCloneAppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    // body fonts
    bodyLarge: TextStyle(color: kTextDarkColor, fontSize: 28.0),
    bodyMedium: TextStyle(color: kTextDarkColor, fontSize: 24.0),
    bodySmall: TextStyle(color: kTextDarkColor, fontSize: 16.0),

    // labels
    labelLarge: TextStyle(color: kTextDarkColor, fontSize: 20.0),
    labelMedium: TextStyle(color: kTextDarkColor, fontSize: 16.0),
    labelSmall: TextStyle(color: kTextDarkColor, fontSize: 8.0),
  );

  static TextTheme darkTextTheme = TextTheme(
    // body fonts
    bodyLarge: TextStyle(color: kTextLightColor, fontSize: 28.0),
    bodyMedium: TextStyle(color: kTextLightColor, fontSize: 24.0),
    bodySmall: TextStyle(color: kTextLightColor, fontSize: 16.0),

    // labels
    labelLarge: TextStyle(color: kTextLightColor, fontSize: 20.0),
    labelMedium: TextStyle(color: kTextLightColor, fontSize: 16.0),
    labelSmall: TextStyle(color: kTextLightColor, fontSize: 8.0),
  );
}

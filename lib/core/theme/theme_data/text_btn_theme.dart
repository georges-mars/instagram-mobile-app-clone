import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TextBtnTheme {
  TextBtnTheme._();

  static TextButtonThemeData textBtnStyle = TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kBlueColor),
        foregroundColor: WidgetStateProperty.all(kTextLightColor),  // text color
        padding: WidgetStateProperty.all(const EdgeInsets.all(10.0)),
        shape: WidgetStateProperty.all(
          BeveledRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
        ),
      ),
    );
}
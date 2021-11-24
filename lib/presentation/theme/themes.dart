import 'package:flutter/material.dart';

import '../../infrastructure/local/manager.dart';
import 'colors.dart';
import 'fonts.dart';

class ApplicationTheme {

  static ThemeData get currentTheme => LocalDatabaseManager.currentTheme? lightTheme : darkTheme;

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: ApplicationColor.primaryColor,
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: ApplicationColor.primaryColor,
          secondary: ApplicationColor.accentColor
        ),
        scaffoldBackgroundColor: ApplicationColor.black,
        fontFamily: ApplicationFont.dDinFontFamily,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: ApplicationColor.primaryColorLight,
      colorScheme: ThemeData().colorScheme.copyWith(
          primary: ApplicationColor.primaryColorLight,
          secondary: ApplicationColor.accentColorLight
      ),
      scaffoldBackgroundColor: ApplicationColor.white,
      fontFamily: ApplicationFont.dDinFontFamily,
    );
  }

}
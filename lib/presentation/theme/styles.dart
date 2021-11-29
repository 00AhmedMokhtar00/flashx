import 'package:flashx/presentation/theme/colors.dart';
import 'package:flashx/presentation/theme/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fonts.dart';

class ApplicationStyles{
  static TextStyle sloganTextStyle = TextStyle(
    fontSize: ApplicationFont.largeSize,
    color: ApplicationTheme.currentTheme.colorScheme.secondary
  );

  static BorderRadiusGeometry borderRadius = BorderRadius.circular(
      16.0
  );
  static BorderRadiusGeometry leftBorderRadius = const BorderRadius.only(
      topLeft: Radius.circular(16.0),
      bottomLeft: Radius.circular(16.0)
  );
  static BorderRadiusGeometry rightBorderRadius = const BorderRadius.only(
      topRight: Radius.circular(16.0),
      bottomRight: Radius.circular(16.0)
  );

  static BoxBorder outlineBorder = Border.all(color: ApplicationColor.lightGreen);
}
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
}
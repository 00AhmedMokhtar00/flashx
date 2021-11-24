import 'package:flutter/material.dart';

import '../pages/splash/splash.dart';

class AppRouter{
  static const String initialRoute = Splash.routeName;

  static Map<String, WidgetBuilder> routes = {
    Splash.routeName: (context) => Splash(),
  };
}
import 'package:flutter/material.dart';

import '../pages/splash/splash.dart';
import '../pages/home/home.dart';

class AppRouter{
  static const String initialRoute = Splash.routeName;

  static Map<String, WidgetBuilder> routes = {
    Splash.routeName: (context) => const Splash(),
    Home.routeName: (context) => Home(),
  };
}
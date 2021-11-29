import 'package:flutter/material.dart';

import '../pages/launch_details/launch_details.dart';
import '../pages/splash/splash.dart';
import '../pages/home/home.dart';

class AppRouter{
  static const String initialRoute = Splash.routeName;

  static Map<String, WidgetBuilder> routes = {
    Splash.routeName: (context) => const Splash(),
    Home.routeName: (context) => Home(),
    LaunchDetails.routeName: (context) => LaunchDetails(),
  };
}
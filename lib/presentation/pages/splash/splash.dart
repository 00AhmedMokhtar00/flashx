import 'package:flutter/material.dart';

import 'widgets/splash_widget.dart';


class Splash extends StatelessWidget {
  static const String routeName = "/splash";

  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashWidget();
  }
}

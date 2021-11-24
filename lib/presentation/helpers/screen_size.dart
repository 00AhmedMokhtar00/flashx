import 'package:flutter/material.dart';

class ApplicationScreenSize{

  static double widthOf(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double heightOf(BuildContext context) =>
      MediaQuery.of(context).size.height;

}
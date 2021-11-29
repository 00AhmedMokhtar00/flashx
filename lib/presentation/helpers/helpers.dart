import 'dart:math';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class Helpers{

  static Color get generateRandomColor =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  static Future<void> launchURL(String url) async{
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
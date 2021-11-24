import 'package:flutter/material.dart';
import 'dart:math';

part 'color_loader.dart';
part 'pulse_loader.dart';

class ApplicationLoader{
  static final Widget currentApplicationLoader = SpinKitPulse(
    itemBuilder: (BuildContext context, int index) {
      return const DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      );
    },
  );

  static const Widget colorApplicationLoader = ColorLoader();
}
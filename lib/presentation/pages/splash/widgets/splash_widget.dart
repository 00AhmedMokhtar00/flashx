import 'package:flutter/material.dart';

import '../../widgets/progress_indicators/application_progress_indicator.dart';
import '../../../helpers/asset_paths.dart';
import '../../../theme/themes.dart';
import 'background.dart';


class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationTheme.currentTheme.primaryColor,
      body: Stack(
        fit: StackFit.loose,
        children: [
          const Background(),

          Align(
            alignment: const Alignment(0.15, -0.115),
            child: Image.asset(
              PresentationAssetPath.LOGO,
              width: 400,
            ),
          ),
          Align(
            alignment: const Alignment(0.0, 0.8),
            child: ApplicationLoader.currentApplicationLoader
          ),
        ],
      ),
    );
  }
}
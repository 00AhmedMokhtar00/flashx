import 'package:flutter/material.dart';

import '../../../helpers/asset_paths.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.darken),
            image: const AssetImage(
                PresentationAssetPath.SPLASH_BACKGROUND,
            ),
          )
      ),
    );
  }
}

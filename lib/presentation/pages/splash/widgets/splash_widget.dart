import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../widgets/progress_indicators/application_progress_indicator.dart';
import '../../../../application/blocs.dart';
import '../../../helpers/asset_paths.dart';
import '../../../theme/themes.dart';
import '../../home/home.dart';
import 'background.dart';


class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationTheme.currentTheme.primaryColor,
      body: BlocListener<NextLaunchBloc, NextLaunchState>(
        listener: (_, state){
          if(state is !NextLaunchLoading){
            Future.delayed(const Duration(milliseconds: 800)).then((_) => Navigator.pushReplacementNamed(context, Home.routeName));
          }
        },
        child: Stack(
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
      )
    );
  }
}
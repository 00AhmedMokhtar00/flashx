import 'package:flashx/application/past_launches/past_launches_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocBuilder<PastLaunchesBloc, PastLaunchesState>(
            // listener: (context, state) {
            //   if(state is PastLaunchesLoading){
            //     print("loading");
            //   } else if(state is PastLaunchesLoadedSuccessfully){
            //     print(state.pastLaunches.first.fairings.reused.toString());
            //   }else if(state is PastLaunchesLoadedFailure){
            //     print(state.errorMessage);
            //   }
            // },
            builder: (_, state){
                if(state is PastLaunchesLoading){
                  return Center(child: const Text("loading", style: TextStyle(color: Colors.white, fontSize: 30.0),));
                } else if(state is PastLaunchesLoadedSuccessfully){
                  return Center(child: Text(state.pastLaunches.first.fairings.reused.toString(), style: TextStyle(color: Colors.white, fontSize: 30.0),));
                }else if(state is PastLaunchesLoadedFailure){
                  return Center(child: Text(state.errorMessage, style: TextStyle(color: Colors.white, fontSize: 30.0),));
                }
                return Center(child: Text("UNDEFINED!?!?!", style: TextStyle(color: Colors.white, fontSize: 30.0)));
            },
          ),
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
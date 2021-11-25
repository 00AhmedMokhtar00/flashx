import 'package:flashx/application/blocs.dart';
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<PastLaunchesBloc, PastLaunchesState>(
                    builder: (_, state){
                        if(state is PastLaunchesLoading){
                          return const Text("loading PastLaunches", style: TextStyle(color: Colors.white, fontSize: 30.0),);
                        } else if(state is PastLaunchesLoadedSuccessfully){
                          return Text(state.pastLaunches.first.fairings.reused.toString(), style: TextStyle(color: Colors.white, fontSize: 30.0),);
                        }else if(state is PastLaunchesLoadedFailure){
                          return Text(state.errorMessage, style: TextStyle(color: Colors.white, fontSize: 30.0),);
                        }
                        return Text("UNDEFINED!?!?!", style: TextStyle(color: Colors.white, fontSize: 30.0));
                    },
                  ),
                  const SizedBox(height: 200.0),
                  BlocBuilder<NextLaunchBloc, NextLaunchState>(
                    builder: (_, state){
                      if(state is NextLaunchLoading){
                        return const Text("loading NextLaunch", style: TextStyle(color: Colors.white, fontSize: 30.0),);
                      } else if(state is NextLaunchLoadedSuccessfully){
                        return Text(state.nextLaunch.name, style: TextStyle(color: Colors.white, fontSize: 30.0),);
                      }else if(state is NextLaunchLoadedFailure){
                        return Text(state.errorMessage, style: TextStyle(color: Colors.white, fontSize: 30.0),);
                      }
                      return Text("UNDEFINED!?!?!", style: TextStyle(color: Colors.white, fontSize: 30.0));
                    },
                  ),
                  const SizedBox(height: 50.0),
                  BlocBuilder<PayloadsBloc, PayloadsState>(
                    builder: (_, state){
                      if(state is PayloadsLoading){
                        return const Text("loading Payloads", style: TextStyle(color: Colors.white, fontSize: 20.0),);
                      } else if(state is PayloadsLoadedSuccessfully){
                        return Text(state.payloads.first.name, style: TextStyle(color: Colors.white, fontSize: 20.0),);
                      }else if(state is PayloadsLoadedFailure){
                        return Text(state.errorMessage, style: TextStyle(color: Colors.white, fontSize: 20.0),);
                      }
                      return Text("UNDEFINED!?!?!", style: TextStyle(color: Colors.white, fontSize: 20.0));
                    },
                  ),
                  const SizedBox(height: 50.0),
                ],
              ),
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
        )
    );
  }
}
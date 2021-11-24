import 'package:flutter/material.dart';

import 'widgets/splash_widget.dart';


class Splash extends StatelessWidget {
  static const String routeName = "/splash";
  Splash({Key? key}) : super(key: key);

  Widget view = SplashWidget();

  @override
  Widget build(BuildContext context) {

    return view;

    // return BlocListener( // TODO
    //   listener: (context, state) {
    //     // if(state is OrdersLoadedSuccessfully){
    //     //   Navigator.pushReplacementNamed(context, HomePage.routeName);
    //     // } else if(state is OrdersLoadedFailure){
    //     //   view = const ServerErrorWidget();
    //     // }
    //   },
    //   child: view,
    // );
  }
}

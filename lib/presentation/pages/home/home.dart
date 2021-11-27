import 'package:flashx/application/blocs.dart';
import 'package:flashx/presentation/helpers/presentation_helpers.dart';
import 'package:flashx/presentation/pages/widgets/progress_indicators/application_progress_indicator.dart';
import 'package:flashx/presentation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/widgets.dart';


class Home extends StatefulWidget {
  static const String routeName = "/home";
   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationTheme.currentTheme.primaryColor,
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const NextLaunchWidget(),

            const PastLaunchesHeader(),

            PastLaunchesList(),
          ],
        ),
      ),
    );
  }

  Future<void> _refresh()async {
    BlocProvider.of<NextLaunchBloc>(context).add(NextLaunchCalled());
    BlocProvider.of<PastLaunchesBloc>(context).add(PastLaunchesCalled());
  }
}

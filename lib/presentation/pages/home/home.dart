import 'package:flashx/presentation/pages/home/widgets/filter_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/blocs.dart';
import '../../theme/themes.dart';
import 'widgets/widgets.dart';

class Home extends StatefulWidget {
  static const String routeName = "/home";
   const Home({Key? key}) : super(key: key);

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

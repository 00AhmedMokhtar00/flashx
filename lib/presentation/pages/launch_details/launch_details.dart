import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/blocs.dart';
import '../../../domain/models.dart';
import 'widgets/widgets.dart';

class LaunchDetails extends StatelessWidget {
  static const String routeName = '/launch-details';
  const LaunchDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Launch launch = ModalRoute.of(context)?.settings.arguments as Launch;
    BlocProvider.of<PayloadsBloc>(context).add(LaunchPayloadsCalled(launch));
    return LaunchDetailsPage(
      launch: launch,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/app_bloc_observer.dart';
import 'presentation/application_widget.dart';
import 'infrastructure/local/manager.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await LocalDatabaseManager.initialLocalDatabase();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const ApplicationWidget());
}
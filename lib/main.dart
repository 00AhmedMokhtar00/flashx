import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/foundation.dart';
//import 'package:device_preview/device_preview.dart';

import 'presentation/application_widget.dart';
import 'infrastructure/local/manager.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabaseManager.initialLocalDatabase();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const ApplicationWidget());

  // runApp(DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const ApplicationWidget()
  // )
  // );
}
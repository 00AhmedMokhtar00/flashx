import 'package:flutter/material.dart';

import 'package:responsive_framework/responsive_framework.dart';

import 'helpers/presentation_helpers.dart';
import 'routes/router.dart';
import 'theme/themes.dart';

class ApplicationWidget extends StatelessWidget {
  const ApplicationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      title: ApplicationTextValue.APP_NAME,
      theme: ApplicationTheme.currentTheme,
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          maxWidth: 1000,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ],
          background: Container(color: const Color(0xFF000000)
          )
      ),
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
    );
  }
}
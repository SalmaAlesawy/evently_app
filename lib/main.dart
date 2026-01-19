import 'package:eventapp/Onboarding/OnbourdingScreen.dart';
import 'package:eventapp/SplashView/SplashScreen.dart';
import 'package:eventapp/core/Routes/app_router.dart';
import 'package:eventapp/core/theme/ThemeManager.dart';
import 'package:flutter/material.dart';

import 'core/Routes/pages_route_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeManager.getLightTheme(),
      darkTheme: ThemeManager.getDarkTheme(),
      themeMode: ThemeMode.light,
      initialRoute: PageRouteName.splash,
      onGenerateRoute: AppRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

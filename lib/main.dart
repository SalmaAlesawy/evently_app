import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:eventapp/core/Routes/app_router.dart';
import 'package:eventapp/core/theme/ThemeManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/Routes/pages_route_names.dart';
void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => AppSettingProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final provider=context.watch<AppSettingProvider>();
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: AppSettingProvider.themeMode,
      theme: ThemeManager.getLightTheme(),
      darkTheme: ThemeManager.getDarkTheme(),
      locale: provider.local,
      supportedLocales: const[
        Locale("en"),
        Locale("ar")],
    //   ], localizationsDelegates:  [
    //   GlobalMaterialLocalizations.delegate,
    //   GlobalWidgetsLocalizations.delegate,
    //   GlobalCupertinoLocalizations.delegate,
    // ],
      initialRoute: PageRouteName.splash,
      onGenerateRoute: AppRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

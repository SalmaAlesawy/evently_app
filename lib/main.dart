import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:eventapp/core/Routes/app_router.dart';
import 'package:eventapp/core/l10n/app_localizations.dart';
import 'package:eventapp/core/theme/ThemeManager.dart';
import 'package:eventapp/firebase_options.dart';
import 'package:eventapp/services/easy_loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import 'core/Routes/pages_route_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ChangeNotifierProvider(
    create: (_) => AppSettingProvider(),
    child: const MyApp(),
  ));
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     print("MyApp rebuild");
    final provider = Provider.of<AppSettingProvider>(context, listen: true);
    return ToastificationWrapper(
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode:provider.themeMode,
        theme: ThemeManager.getLightTheme(),
        darkTheme: ThemeManager.getDarkTheme(),
        locale: Locale(provider.currentLanguage),
        initialRoute: PageRouteName.splash,
        onGenerateRoute: AppRouter.onGenerateRoute,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
      ),
    );
  }
}

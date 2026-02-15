import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:eventapp/core/Routes/pages_route_names.dart';
import 'package:eventapp/core/l10n/app_localizations.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/gen/assets.gen.dart';

class Onbourdingscreen extends StatelessWidget {
  const Onbourdingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final appLocalization=AppLocalizations.of(context)!;
    final provider=Provider.of<AppSettingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Assets.images.eventlyLogo.image(width: 200, height: 200),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           provider.themeMode==ThemeMode.light? Assets.images.beingCreative.image():Assets.images.darkBeingCreative3.image(),
            Text(
              appLocalization.onboarding_title_1,
              style: provider.themeMode==ThemeMode.light? textTheme.titleLarge:textTheme.titleLarge?.copyWith(color: DarkColorPalette.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              appLocalization.onboarding_description_1,
              style: provider.themeMode==ThemeMode.light? textTheme.titleMedium:textTheme.titleMedium?.copyWith(color: DarkColorPalette.darkSecText),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    appLocalization.language,
                    style: provider.themeMode==ThemeMode.light? textTheme.bodyLarge:textTheme.bodyLarge?.copyWith(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll( provider.themeMode==ThemeMode.light?LightColorPalette.lightMainColor:DarkColorPalette.darkMainColor),
                        foregroundColor:
                            WidgetStatePropertyAll(LightColorPalette.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      provider.setEnglish();
                    },
                    child:Text(appLocalization.english)),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll( provider.themeMode==ThemeMode.light?LightColorPalette.white:DarkColorPalette.darkInputs),
                        foregroundColor:
                            WidgetStatePropertyAll( provider.themeMode==ThemeMode.light?LightColorPalette.lightMainColor:DarkColorPalette.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      provider.setArabic();
                    },
                    child:Text(appLocalization.arabic)),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                  child: Text(
                    appLocalization.theme,
                    style: provider.themeMode==ThemeMode.light? textTheme.bodyLarge:textTheme.bodyLarge?.copyWith(color: DarkColorPalette.white),
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll( provider.themeMode==ThemeMode.light?LightColorPalette.lightMainColor:DarkColorPalette.darkInputs),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      provider.setLight();
                    },
                    child: Assets.icons.sun.svg()),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll( provider.themeMode==ThemeMode.light?LightColorPalette.white:DarkColorPalette.darkMainColor),
                    foregroundColor:
                        WidgetStatePropertyAll(LightColorPalette.white),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    provider.setDark();
                  },
                  child: provider.themeMode==ThemeMode.light? Assets.icons.moon.svg():Assets.icons.vector.svg(),
                )
              ],
            ),
            const SizedBox(height: 40,),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll( provider.themeMode==ThemeMode.light?LightColorPalette.lightMainColor:DarkColorPalette.darkMainColor),
                      foregroundColor:
                          WidgetStatePropertyAll(LightColorPalette.white),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, PageRouteName.onBoardingPages);
                    },
                    child:  Text(appLocalization.start,style: textTheme.titleLarge?.copyWith(color: LightColorPalette.white),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

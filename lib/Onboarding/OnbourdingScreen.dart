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
            Assets.images.beingCreative.image(),
            Text(
              appLocalization.onboarding_title_1,
              style: textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              appLocalization.onboarding_description_1,
              style: textTheme.titleMedium,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    appLocalization.language,
                    style: textTheme.bodyLarge,
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(ColorPalette.lightMainColor),
                        foregroundColor:
                            WidgetStatePropertyAll(ColorPalette.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      provider.setEnglish();
                    },
                    child:  Text(appLocalization.english)),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(ColorPalette.white),
                        foregroundColor:
                            WidgetStatePropertyAll(ColorPalette.lightMainColor),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      provider.setArabic();
                    },
                    child:  Text(appLocalization.arabic)),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                  child: Text(
                    appLocalization.theme,
                    style: textTheme.bodyLarge,
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(ColorPalette.lightMainColor),
                      foregroundColor:
                          WidgetStatePropertyAll(ColorPalette.white),
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
                        WidgetStatePropertyAll(ColorPalette.white),
                    foregroundColor:
                        WidgetStatePropertyAll(ColorPalette.lightMainColor),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    provider.setDark();
                  },
                  child: Assets.icons.moon.svg(),
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
                          WidgetStatePropertyAll(ColorPalette.lightMainColor),
                      foregroundColor:
                          WidgetStatePropertyAll(ColorPalette.white),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, PageRouteName.onBoardingPages);
                    },
                    child:  Text(appLocalization.start,style: textTheme.titleLarge?.copyWith(color: ColorPalette.white),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

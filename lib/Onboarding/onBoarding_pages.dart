import 'package:eventapp/core/Routes/pages_route_names.dart';
import 'package:eventapp/core/constants/AppTexts.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_setting_provider/app_setting_provider.dart';
import '../core/gen/assets.gen.dart';
import '../core/l10n/app_localizations.dart';
import 'onBoarding_pages_details.dart';

class OnboardingPages extends StatelessWidget {
  static final PageController controller = PageController();

  const OnboardingPages({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppSettingProvider>(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              final int currentPage =
                  controller.hasClients ? controller.page?.round() ?? 0 : 0;
              return currentPage != 0
                  ? IconButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              provider.themeMode == ThemeMode.light
                                  ? LightColorPalette.white
                                  : DarkColorPalette.darkInputs),
                          foregroundColor: WidgetStatePropertyAll(
                              provider.themeMode == ThemeMode.light
                                  ? LightColorPalette.lightMainColor
                                  : DarkColorPalette.white),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)))),
                      onPressed: () {
                        controller.previousPage(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOut);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new))
                  : const Placeholder(
                      color: Colors.transparent,
                    );
            }),
        backgroundColor: Colors.transparent,
        title: provider.themeMode == ThemeMode.light
            ? Assets.images.eventlyLogo.image(width: 243, height: 32)
            : Assets.images.darkEventlyLogo.image(width: 243, height: 32),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      provider.themeMode == ThemeMode.light
                          ? LightColorPalette.white
                          : DarkColorPalette.darkInputs),
                  foregroundColor: WidgetStatePropertyAll(
                      provider.themeMode == ThemeMode.light
                          ? LightColorPalette.lightMainColor
                          : DarkColorPalette.white),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, PageRouteName.loginScreen);
                },
                child: Text(
                  "Skip",
                  style: provider.themeMode==ThemeMode.light?textTheme.bodyMedium?.copyWith(color: LightColorPalette.lightMainText):textTheme.bodyMedium?.copyWith(
                    color: DarkColorPalette.darkInputs
                  ),
                )),
          )
        ],
      ),
      body: SafeArea(
          child: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              OnboardingPagesDetails(
                title: AppTexts.onBoardingTitle1,
                description: AppTexts.onBoardingDescription1,
                image: provider.themeMode == ThemeMode.light
                    ? Assets.images.hotTrending.keyName
                    : Assets.images.darkHotTrending1.keyName,
              ),
              OnboardingPagesDetails(
                title: AppTexts.onBoardingTitle2,
                description: AppTexts.onBoardingDescription2,
                image: provider.themeMode == ThemeMode.light
                    ? Assets.images.eventPlanning.keyName
                    : Assets.images.darkEventPlanning.keyName,
              ),
              OnboardingPagesDetails(
                doneText: "Get Started",
                title: AppTexts.onBoardingTitle3,
                description: AppTexts.onBoardingDescription3,
                image: provider.themeMode == ThemeMode.light
                    ? Assets.images.connectWithFriends.keyName
                    : Assets.images.darkSharewithfriends.keyName,
              ),
            ],
          ),
        ],
      )),
    );
  }
}

import 'package:eventapp/core/Routes/pages_route_names.dart';
import 'package:eventapp/core/constants/AppTexts.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:flutter/material.dart';

import '../core/gen/assets.gen.dart';
import 'onBoarding_pages_details.dart';

class OnboardingPages extends StatelessWidget {
  static final PageController controller = PageController();
  const OnboardingPages({super.key});
  @override
  Widget build(BuildContext context) {
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
                          backgroundColor:
                              WidgetStatePropertyAll(ColorPalette.white),
                          foregroundColor: WidgetStatePropertyAll(
                              ColorPalette.lightMainColor),
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
        title: Assets.images.eventlyLogo.image(width: 243, height: 32),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(ColorPalette.white),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, PageRouteName.loginScreen);
                },
                child: Text(
                  "Skip",
                  style: textTheme.bodyMedium
                      ?.copyWith(color: ColorPalette.lightMainColor),
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
                image: Assets.images.hotTrending.keyName,
              ),
              OnboardingPagesDetails(
                title: AppTexts.onBoardingTitle2,
                description: AppTexts.onBoardingDescription2,
                image: Assets.images.eventPlanning.keyName,
              ),
              OnboardingPagesDetails(
                doneText: "Get Started",
                title: AppTexts.onBoardingTitle3,
                description: AppTexts.onBoardingDescription3,
                image: Assets.images.connectWithFriends.keyName,
              ),
            ],
          ),
        ],
      )),
    );
  }
}

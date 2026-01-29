import 'package:eventapp/core/constants/AppTexts.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../core/gen/assets.gen.dart';
import 'onBoarding_pages_details.dart';

class OnboardingPages extends StatelessWidget {
  static final PageController controller = PageController();
   OnboardingPages({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Assets.images.eventlyLogo.image(width: 243, height: 32),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(ColorPalette.darkMainText),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                ),
                onPressed: () {},
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

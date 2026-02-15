import 'package:eventapp/core/Routes/pages_route_names.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../app_setting_provider/app_setting_provider.dart';
import '../widgets/CustomElevatedButton.dart' show Customelevatedbutton;
import 'onBoarding_pages.dart';

class OnboardingPagesDetails extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final String? doneText;
  static PageController controller = OnboardingPages.controller;

  const OnboardingPagesDetails({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    this.doneText,
  });

  @override
  State<OnboardingPagesDetails> createState() => _OnboardingPagesDetailsState();
}

class _OnboardingPagesDetailsState extends State<OnboardingPagesDetails> {
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<AppSettingProvider>(context);

    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 5,
                child: Center(
                    child: Image.asset(
                  widget.image,
                  width: 343,
                  height: 343,
                ))),
            Center(
              child: SmoothPageIndicator(
                controller: OnboardingPagesDetails.controller,
                count: 3,
                effect:  WormEffect(
                  dotColor:  provider.themeMode==ThemeMode.light?LightColorPalette.lightDarkDisable:DarkColorPalette.white ,
                  activeDotColor:  provider.themeMode==ThemeMode.light? LightColorPalette.lightMainColor:DarkColorPalette.darkMainColor ,
                  dotWidth: 10,
                  dotHeight: 10,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.title,
              style: provider.themeMode==ThemeMode.light? textTheme.titleLarge:textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Text(
                widget.description,
                style: provider.themeMode==ThemeMode.light? textTheme.titleMedium:textTheme.titleLarge?.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Customelevatedbutton(
              backGroundColor:WidgetStatePropertyAll( provider.themeMode==ThemeMode.light?LightColorPalette.lightMainColor:DarkColorPalette.darkMainColor) ,
              forGroundColor:WidgetStatePropertyAll(LightColorPalette.white) ,
              buttonText: widget.doneText ?? "Next",
              onPressed: () {
                OnboardingPagesDetails.controller.nextPage(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut);
                if (OnboardingPagesDetails.controller.page == 2) {
                  Navigator.pushReplacementNamed(
                      context, PageRouteName.loginScreen);
                }
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}

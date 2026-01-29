import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../core/gen/assets.gen.dart';
import 'onBoarding_pages.dart';

class OnboardingPagesDetails extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  static PageController controller = OnboardingPages.controller;
  const OnboardingPagesDetails({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  State<OnboardingPagesDetails> createState() => _OnboardingPagesDetailsState();
}

class _OnboardingPagesDetailsState extends State<OnboardingPagesDetails> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex: 5,child: Center(child: Image.asset(widget.image,width: 343,height:343,))),

            Center(
              child: SmoothPageIndicator(
                controller: OnboardingPagesDetails.controller,
                count: 3,
                effect: const WormEffect(
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
              style: textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Text(
                widget.description,
                style: textTheme.titleMedium,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(ColorPalette.lightMainColor),
                    foregroundColor:
                        WidgetStatePropertyAll(ColorPalette.darkMainText),
                    textStyle: WidgetStatePropertyAll(textTheme.titleLarge),
                    padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 16)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)))),
                onPressed: () {
                  OnboardingPagesDetails.controller.nextPage(duration: const Duration(seconds: 1), curve: Curves.easeInOut);
                  
                },
                child: const Text("Next"))
          ],
        ),
      ),
    );
  }
}

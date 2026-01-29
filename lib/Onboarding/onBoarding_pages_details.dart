import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../core/gen/assets.gen.dart';
import 'onBoarding_pages.dart';

class OnboardingPagesDetails extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  static PageController controller = OnboardingPages.controller;
   const OnboardingPagesDetails(
      {super.key,
      required this.title,
      required this.description,
      required this.image,});

  @override
  State<OnboardingPagesDetails> createState() => _OnboardingPagesDetailsState();
}

class _OnboardingPagesDetailsState extends State<OnboardingPagesDetails> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(widget.image)),
           const SizedBox(height: 10,),
           Center(child: SmoothPageIndicator(controller: OnboardingPagesDetails.controller, count: 3)),
            const SizedBox(height: 10,),
            Text(widget.title,style:textTheme.titleLarge ,),
            const SizedBox(height: 10,),
            Text(widget.description,style: textTheme.titleMedium,),
          ],
        ),
      ),
    );
  }
}

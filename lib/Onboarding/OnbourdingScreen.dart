import 'package:eventapp/core/Routes/pages_route_names.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:flutter/material.dart';

import '../core/gen/assets.gen.dart';

class Onbourdingscreen extends StatelessWidget {
  const Onbourdingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
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
              "Personalize Your Experience",
              style: textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Choose your preferred theme and language to get started with a comfortable,"
              " tailored experience that suits your style.",
              style: textTheme.titleMedium,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Language",
                    style: textTheme.bodyLarge,
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(ColorPalette.lightMainColor),
                        foregroundColor:
                            WidgetStatePropertyAll(ColorPalette.darkMainText),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {},
                    child: const Text("English")),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(ColorPalette.darkMainText),
                        foregroundColor:
                            WidgetStatePropertyAll(ColorPalette.lightMainColor),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {},
                    child: const Text("Arabic")),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Theme",
                    style: textTheme.bodyLarge,
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(ColorPalette.lightMainColor),
                      foregroundColor:
                          WidgetStatePropertyAll(ColorPalette.darkMainText),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Assets.icons.sun.svg()),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(ColorPalette.darkMainText),
                    foregroundColor:
                        WidgetStatePropertyAll(ColorPalette.lightMainColor),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {},
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
                          WidgetStatePropertyAll(ColorPalette.darkMainText),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, PageRouteName.onBoardingPages);
                    },
                    child:  Text("Let's Start",style: textTheme.titleLarge?.copyWith(color: ColorPalette.darkMainText),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

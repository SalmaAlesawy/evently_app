import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:eventapp/widgets/CustomListView.dart';
import 'package:eventapp/widgets/CustomStack.dart';
import 'package:flutter/material.dart';

import '../../core/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Welcome Back ✨",
          style: textTheme.bodyMedium?.copyWith(
              color: ColorPalette.lightSecText, fontWeight: FontWeight.w400),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {}, icon: Assets.icons.sun2.svg()),
          IconButton(onPressed: () {}, icon: Assets.icons.en.svg())
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Jone Safwat",
              style: textTheme.titleLarge?.copyWith(
                  color: ColorPalette.lightMainText,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const Customelistview(
                  );
                },
                itemCount: 4,
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const Customstack();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 5),
            )
          ],
        ),
      ),
    );
  }
}

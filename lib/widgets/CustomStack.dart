import 'package:flutter/material.dart';

import '../core/gen/assets.gen.dart';
import '../core/theme/ColorPalette.dart';

class Customstack extends StatelessWidget {
  const Customstack({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme =Theme.of(context).textTheme;
    return Stack(
      children: [
        Assets.images.birthday.image(),
        Positioned(
          top:10,
          left:10,
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            width: 70,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorPalette.lightBackGround,
            ),
            child: Text(
              "21 Jan",
              style: textTheme.titleMedium?.copyWith(
                  color: ColorPalette.lightMainColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: ColorPalette.lightBackGround,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "This is a Birthday Party",
                  style: textTheme.bodyMedium?.copyWith(
                      color: ColorPalette.lightMainText,
                      fontWeight: FontWeight.w500),
                ),
                Assets.icons.heartUnselected.svg()
              ],
            ),
          ),
        ),
      ],
    );
  }
}

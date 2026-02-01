import 'package:flutter/material.dart';

import '../core/theme/ColorPalette.dart';

class Customcontainer extends StatelessWidget {
  const Customcontainer(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});
  final String text;
  final Widget icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: textTheme.titleMedium?.copyWith(
                color: ColorPalette.lightMainText, fontWeight: FontWeight.w500),
          ),
          IconButton(
            onPressed: onPressed,
            icon: icon,
          )
        ],
      ),
    );
  }
}

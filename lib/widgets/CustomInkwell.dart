import 'package:flutter/material.dart';

import '../core/theme/ColorPalette.dart';

class Custominkwell extends StatelessWidget {
  const Custominkwell({super.key,required this.icon,required this.onTap});
 final Widget icon;
 final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: ColorPalette.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding:const EdgeInsets.all(5) ,
        child: icon,
      ),
    );
  }
}

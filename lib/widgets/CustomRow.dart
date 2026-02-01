import 'package:flutter/material.dart';

import '../core/gen/assets.gen.dart';
import '../core/theme/ColorPalette.dart';

class Customelistview extends StatelessWidget {
  const Customelistview({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 90,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorPalette.lightMainColor,
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Assets.icons.allicon.svg(),
          const SizedBox(width: 10,),
          const Text("All"),
        ],
      ),
    );
  }
}

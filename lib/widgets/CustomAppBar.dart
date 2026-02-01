import 'package:flutter/material.dart';

import '../core/theme/ColorPalette.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  const Customappbar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(title),
      centerTitle: true,
      leading: IconButton(
          style: ButtonStyle(
            foregroundColor:
            WidgetStatePropertyAll(ColorPalette.lightMainColor),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8))),
            backgroundColor: WidgetStatePropertyAll(ColorPalette.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new)),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}

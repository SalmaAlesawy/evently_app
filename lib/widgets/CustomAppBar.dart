import 'package:eventapp/widgets/CustomInkwell.dart';
import 'package:flutter/material.dart';

import '../core/gen/assets.gen.dart';
import '../core/theme/ColorPalette.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  const Customappbar({super.key, required this.title, this.showAction = false,  this.onTap1,  this.onTap2});
  final String title;
  final bool showAction;
  final void Function()? onTap1;
  final void Function()?onTap2;


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
            shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            backgroundColor: WidgetStatePropertyAll(ColorPalette.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new)),
      actions: [
        showAction != false
            ? Row(
                children: [
                  Custominkwell(
                    icon: Assets.icons.edit2.svg(),
                    onTap:onTap1!,
                  ),
                  Custominkwell(
                    icon: Assets.icons.trash.svg(),
                    onTap: onTap2!,
                  )
                ],
              )
            : Container()
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}

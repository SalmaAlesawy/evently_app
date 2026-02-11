import 'package:eventapp/widgets/CustomeTextButton.dart';
import 'package:flutter/material.dart';

class Customlisttile extends StatelessWidget {
  const Customlisttile(
      {super.key,
      required this.leading,
      required this.titleText,
      required this.trailingText,
        required this.onPressed});
  final Widget leading;
  final String titleText;
  final String trailingText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(titleText),
      trailing: Custometextbutton(
        textButton: trailingText,
        onpressed: onPressed,
      ),
    );
  }
}

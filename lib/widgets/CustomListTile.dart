import 'package:eventapp/widgets/CustomeTextButton.dart';
import 'package:flutter/material.dart';

class Customlisttile extends StatelessWidget {
  const Customlisttile(
      {super.key,
      required this.leading,
      required this.titleText,
      required this.trailingText,
        required this.onPressed,
         this.subtitleText});
  final Widget leading;
  final String titleText;
  final String trailingText;
  final String? subtitleText;
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
      subtitle:subtitleText!=null? Text(subtitleText!):null,
    );
  }
}

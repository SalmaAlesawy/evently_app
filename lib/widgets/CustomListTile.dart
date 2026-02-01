import 'package:eventapp/widgets/CustomeTextButton.dart';
import 'package:flutter/material.dart';

class Customlisttile extends StatelessWidget {
  const Customlisttile({super.key, required this.leading, required this.titleText, required this.trailingText});
  final Widget leading;
  final String titleText;
  final String trailingText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title:  Text(titleText),
      trailing: TextButton(
        onPressed: () {},
        child: Custometextbutton(textButton: trailingText, onpressed: () {},
        ),
      ),
    );
  }
}

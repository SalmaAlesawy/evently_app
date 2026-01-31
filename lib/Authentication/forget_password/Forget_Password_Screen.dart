import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:eventapp/widgets/CustomElevatedButton.dart';
import 'package:flutter/material.dart';

import '../../core/gen/assets.gen.dart' show Assets;

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Forget Password"),
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Assets.images.resetPassword.image(),
              const SizedBox(
                height: 30,
              ),
              Customelevatedbutton(
                buttonText: "Reset password",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

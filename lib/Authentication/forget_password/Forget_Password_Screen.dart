import 'package:eventapp/widgets/CustomAppBar.dart';
import 'package:eventapp/widgets/CustomElevatedButton.dart';
import 'package:flutter/material.dart';

import '../../core/gen/assets.gen.dart' show Assets;

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const Customappbar(title: "Forget Password",),
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

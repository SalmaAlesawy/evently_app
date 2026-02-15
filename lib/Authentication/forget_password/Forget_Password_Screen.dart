import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:eventapp/widgets/CustomAppBar.dart';
import 'package:eventapp/widgets/CustomElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/gen/assets.gen.dart' show Assets;

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<AppSettingProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: const Customappbar(title: "Forget Password",),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             provider.themeMode==ThemeMode.light? Assets.images.resetPassword.image():Assets.images.darkresetPassword.image(),
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

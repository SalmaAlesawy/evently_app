import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:eventapp/core/Routes/pages_route_names.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:eventapp/core/utils/Firebase_auth_utils.dart';
import 'package:eventapp/widgets/CustemTextformField.dart';
import 'package:eventapp/widgets/CustomElevatedButton.dart';
import 'package:eventapp/widgets/CustomeTextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import '../../core/gen/assets.gen.dart';
import '../../core/l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    final appLocalization=AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    final provider=Provider.of<AppSettingProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               provider.themeMode==ThemeMode.light? Assets.images.eventlyLogo.image(width: 142, height: 27):Assets.images.darkEventlyLogo.image(width: 142, height: 27),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Login to your account",
                  style:provider.themeMode==ThemeMode.light? textTheme.headlineSmall:textTheme.headlineSmall?.copyWith(color: DarkColorPalette.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                Custemtextformfield(
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  prefixIcon: Assets.icons.sms.svg(width: 24, height: 24),
                  hintText: appLocalization.email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!isValidEmail(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Custemtextformfield(
                  controller: _passwordController,
                  obscureText: obscureText,
                  prefixIcon: Assets.icons.lock.svg(width: 24, height: 24),
                  hintText: appLocalization.password,
                  suffixIcon: IconButton(
                      onPressed: () {
                        obscureText = !obscureText;
                        setState(() {});
                      },
                      icon: obscureText == true
                          ? Icon(Icons.visibility_off_outlined,
                              color: LightColorPalette.lightDarkDisable)
                          :  Icon(Icons.visibility_outlined,
                              color:LightColorPalette.lightDarkDisable)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return 'Must contain at least one uppercase letter';
                    }
                    if (!RegExp(r'[a-z]').hasMatch(value)) {
                      return 'Must contain at least one lowercase letter';
                    }
                    if (!RegExp(r'[0-9]').hasMatch(value)) {
                      return 'Must contain at least one number';
                    }
                    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                      return 'Must contain at least one special character';
                    }
                    return null;
                  },
                ),
                Custometextbutton(
                    textButton: appLocalization.forgetPassword,
                    onpressed: () {
                      Navigator.pushNamed(
                          context, PageRouteName.forgerPasswordScreen);
                    }),
                const SizedBox(
                  height: 40,
                ),
                Customelevatedbutton(
                  buttonText: "Login",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      EasyLoading.show();
                      FireBaseAuthUtils.signInWithEmailAndPassword(_emailController.text, _passwordController.text).then((value){
                        EasyLoading.dismiss();
                        if(value){
                          toastification.show(title: const Text("Login Successfully"),type: ToastificationType.success,alignment: Alignment.center);
                          Navigator.pushReplacementNamed(context, PageRouteName.layoutScreen);
                        }
                      });


                    }
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: textTheme.bodyMedium
                          ?.copyWith(color:provider.themeMode==ThemeMode.light? LightColorPalette.lightSecText:DarkColorPalette.darkSecText),
                    ),
                    Custometextbutton(

                      onpressed: () {
                        Navigator.pushReplacementNamed(
                            context, PageRouteName.registerScreen);
                      },
                      textButton: "Sign up",
                    ),
                  ],
                ),
                Text(
                  "Or",
                  style: textTheme.titleMedium?.copyWith(
                      color: provider.themeMode==ThemeMode.light? LightColorPalette.lightMainColor:DarkColorPalette.darkMainColor,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Customelevatedbutton(
                  image: Assets.images.google.keyName,
                  onPressed: () {},
                  buttonText: "Login With Google",
                  backGroundColor: WidgetStatePropertyAll(provider.themeMode==ThemeMode.light? LightColorPalette.white:DarkColorPalette.darkInputs),
                  forGroundColor:
                      WidgetStatePropertyAll(provider.themeMode==ThemeMode.light? LightColorPalette.lightMainColor:DarkColorPalette.darkMainColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

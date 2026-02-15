import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:eventapp/core/Routes/pages_route_names.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:eventapp/core/utils/Firebase_auth_utils.dart';
import 'package:eventapp/widgets/CustomElevatedButton.dart';
import 'package:eventapp/widgets/CustomeTextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import '../../core/gen/assets.gen.dart' show Assets;
import '../../widgets/CustemTextformField.dart' show Custemtextformfield;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final provider = Provider.of<AppSettingProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 64),
                child: Assets.images.eventlyLogo.image(
                    width: 142, height: 27, alignment: AlignmentGeometry.center),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(
                  17,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Create your account",
                        style: textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Custemtextformfield(
                        controller: _nameController,
                        obscureText: false,
                        hintText: "Enter your name",
                        prefixIcon: Assets.icons.userUnselected.svg(),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          } else if (value.length < 3) {
                            return 'Name must be at least 3 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Custemtextformfield(
                        controller: _emailController,
                        obscureText: false,
                        hintText: "Enter your email",
                        prefixIcon: Assets.icons.sms.svg(),
                        keyboardType: TextInputType.text,
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
                        hintText: "Enter your password",
                        prefixIcon: Assets.icons.lock.svg(),
                        keyboardType: TextInputType.text,
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
                        suffixIcon: IconButton(
                            onPressed: () {
                              obscureText = !obscureText;
                              setState(() {});
                            },
                            icon: obscureText == true
                                ? Icon(Icons.visibility_off_outlined,
                                    color: provider.themeMode == ThemeMode.light
                                        ? LightColorPalette.lightDarkDisable
                                        : DarkColorPalette.lightDarkDisable)
                                : Icon(Icons.visibility_outlined,
                                    color: provider.themeMode == ThemeMode.light
                                        ? LightColorPalette.lightDarkDisable
                                        : DarkColorPalette.lightDarkDisable)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Custemtextformfield(
                        controller: _confirmPasswordController,
                        obscureText: obscureText,
                        hintText: "Confirm your password",
                        prefixIcon: Assets.icons.lock.svg(),
                        keyboardType: TextInputType.text,
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
                          if (_passwordController.text !=
                              _confirmPasswordController.text) {
                            return "Please enter the same password";
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                            onPressed: () {
                              obscureText = !obscureText;
                              setState(() {});
                            },
                            icon: obscureText == true
                                ? Icon(Icons.visibility_off_outlined,
                                    color: provider.themeMode == ThemeMode.light
                                        ? LightColorPalette.lightDarkDisable
                                        : DarkColorPalette.lightDarkDisable)
                                : Icon(Icons.visibility_outlined,
                                    color: provider.themeMode == ThemeMode.light
                                        ? LightColorPalette.lightDarkDisable
                                        : DarkColorPalette.lightDarkDisable)),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Customelevatedbutton(
                        buttonText: "Sign up",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            EasyLoading.show();
                            FireBaseAuthUtils.signUp(_nameController.text,_emailController.text,
                                    _passwordController.text,)
                                .then((value) {
                              EasyLoading.dismiss();
                              if (value) {
                                toastification.show(
                                    title: const Text(
                                        "User created account successfully"),
                                    type: ToastificationType.success,
                                    alignment: Alignment.center);
                                Navigator.pushReplacementNamed(
                                    context, PageRouteName.loginScreen);
                              }
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: textTheme.bodyMedium?.copyWith(
                        color: provider.themeMode == ThemeMode.light
                            ? LightColorPalette.lightSecText
                            : DarkColorPalette.darkSecText),
                  ),
                  Custometextbutton(
                      textButton: "Login",
                      onpressed: () {
                        Navigator.pushReplacementNamed(
                            context, PageRouteName.loginScreen);
                      })
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Or",
                style: textTheme.titleMedium?.copyWith(
                    color: provider.themeMode == ThemeMode.light
                        ? LightColorPalette.lightMainColor
                        : DarkColorPalette.darkMainColor,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Customelevatedbutton(
                  image: Assets.images.google.keyName,
                  onPressed: () {},
                  buttonText: "Sign up With Google",
                  backGroundColor: WidgetStatePropertyAll(provider.themeMode==ThemeMode.light? LightColorPalette.white:DarkColorPalette.darkInputs),
                  forGroundColor:
                  WidgetStatePropertyAll(provider.themeMode==ThemeMode.light? LightColorPalette.lightMainColor:DarkColorPalette.darkMainColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:eventapp/core/Routes/pages_route_names.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:eventapp/widgets/CustemTextformField.dart';
import 'package:eventapp/widgets/CustomElevatedButton.dart';
import 'package:eventapp/widgets/CustomeTextButton.dart';
import 'package:flutter/material.dart';

import '../../core/gen/assets.gen.dart';

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
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.lightBackGround,
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Assets.images.eventlyLogo.image(width: 142, height: 27),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Login to your account",
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 30,
                ),
                Custemtextformfield(
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                  obscureText: obscureText,
                  prefixIcon: Assets.icons.sms.svg(width: 24, height: 24),
                  hintText: "Enter your email ",
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
                  hintText: "Enter your password",
                  suffixIcon: IconButton(
                      onPressed: () {
                        obscureText = !obscureText;
                        setState(() {});
                      },
                      icon: obscureText == true
                          ? const Icon(Icons.visibility_outlined,
                              color: Color(
                                0xFFB9B9B9,
                              ))
                          : const Icon(Icons.visibility_off_outlined,
                              color: Color(
                                0xFFB9B9B9,
                              ))),
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
                    textButton: "Forger password?",
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("All fields are valid"),
                        ),
                      );
                      Navigator.pushReplacementNamed(context, PageRouteName.layoutScreen);
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
                          ?.copyWith(color: ColorPalette.lightSecText),
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
                      color: ColorPalette.lightMainColor,
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
                  backGroundColor: WidgetStatePropertyAll(ColorPalette.white),
                  forGroundColor:
                      WidgetStatePropertyAll(ColorPalette.lightMainColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

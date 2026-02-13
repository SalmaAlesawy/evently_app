import 'package:eventapp/core/Routes/pages_route_names.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:eventapp/core/utils/Firebase_auth_utils.dart';
import 'package:eventapp/widgets/CustomElevatedButton.dart';
import 'package:eventapp/widgets/CustomeTextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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

  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.lightBackGround,
        body: Column(
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
                      obscureText: obscureText,
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
                      obscureText: obscureText,
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
                              ? const Icon(Icons.visibility_outlined,
                                  color: Color(
                                    0xFFB9B9B9,
                                  ))
                              : const Icon(Icons.visibility_off_outlined,
                                  color: Color(
                                    0xFFB9B9B9,
                                  ))),
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
                              ? const Icon(Icons.visibility_outlined,
                                  color: Color(
                                    0xFFB9B9B9,
                                  ))
                              : const Icon(Icons.visibility_off_outlined,
                                  color: Color(
                                    0xFFB9B9B9,
                                  ))),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Customelevatedbutton(
                      buttonText: "Sign up",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          EasyLoading.show();
                          FireBaseAuthUtils.signUp(_emailController.text,
                                  _passwordController.text)
                              .then((value) {
                            EasyLoading.dismiss();
                            if(value){
                              toastification.show(
                                  title: const Text(
                                      "User created account successfullty"),
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
                  style: textTheme.bodyMedium
                      ?.copyWith(color: ColorPalette.lightSecText),
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
              buttonText: "Sign up With Google",
              backGroundColor: WidgetStatePropertyAll(ColorPalette.white),
              forGroundColor:
                  WidgetStatePropertyAll(ColorPalette.lightMainColor),
            )
          ],
        ),
      ),
    );
  }
}

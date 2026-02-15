import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:eventapp/widgets/CustomContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/gen/assets.gen.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final provider = Provider.of<AppSettingProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                width: 104,
                height: 104,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Assets.images.routeLogo.provider(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "John Safwat",
                style: textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "johnsafwat.route@gmail.com",
                style: textTheme.bodyMedium?.copyWith(
                    color: provider.themeMode == ThemeMode.light
                        ? LightColorPalette.lightSecText
                        : DarkColorPalette.darkSecText,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              Customcontainer(
                text: "Dark mode",
                icon: provider.themeMode == ThemeMode.light
                    ? Assets.icons.toggleOff.svg()
                    : Assets.icons.toggleOn.svg(),
                onPressed: () {
                  provider.themeMode == ThemeMode.light
                      ? provider.changeTheme(ThemeMode.dark)
                      : provider.changeTheme(ThemeMode.light);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Customcontainer(
                text: "Language",
                icon: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: provider.themeMode == ThemeMode.light
                      ? LightColorPalette.lightMainColor
                      : DarkColorPalette.darkMainColor,
                ),
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              Customcontainer(
                text: "Logout",
                icon: Icon(
                  Icons.logout,
                  color: LightColorPalette.red,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

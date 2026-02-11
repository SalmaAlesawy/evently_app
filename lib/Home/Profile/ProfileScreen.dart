import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:eventapp/widgets/CustomContainer.dart';
import 'package:flutter/material.dart';

import '../../core/gen/assets.gen.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
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
                    color: ColorPalette.lightSecText,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              Customcontainer(
                text: "Dark mode",
                icon: Assets.icons.toggleOff.svg(),
                onPressed: () {},
              ),
              const SizedBox(height: 20,),
              Customcontainer(
                text: "Language",
                icon: Icon(Icons.arrow_forward_ios_sharp,color: ColorPalette.lightMainColor,),
                onPressed: () {},
              ),
              const SizedBox(height: 20,),
              Customcontainer(
                text: "Logout",
                icon: Icon(Icons.logout,color: ColorPalette.red,),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

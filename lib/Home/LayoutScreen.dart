import 'package:eventapp/Home/Favourite/FavourateScreen.dart';
import 'package:eventapp/Home/Home_screen/Home_Screen.dart';
import 'package:eventapp/Home/Profile/ProfileScreen.dart';
import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:eventapp/core/Routes/pages_route_names.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/gen/assets.gen.dart';

class Layoutscreen extends StatefulWidget {
  const Layoutscreen({super.key});

  @override
  State<Layoutscreen> createState() => _LayoutscreenState();
}

class _LayoutscreenState extends State<Layoutscreen> {
  List<Widget>screens=[
     HomeScreen(),
     Favouratescreen(),
    const Profilescreen(),
  ];


  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<AppSettingProvider>(context);
    return Scaffold(
        body: screens[provider.currentIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, PageRouteName.addEvent);
          },
          backgroundColor: provider.themeMode==ThemeMode.light? LightColorPalette.lightMainColor:DarkColorPalette.darkMainColor,
          foregroundColor: LightColorPalette.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
            color: Colors.transparent
          ),
          child: BottomNavigationBar(
            elevation: 0,
            enableFeedback: false,
            backgroundColor: Colors.transparent,
              selectedFontSize: 12,
              selectedItemColor: provider.themeMode==ThemeMode.light? LightColorPalette.lightMainColor:DarkColorPalette.darkMainColor,
              onTap: provider.changeCurrentIndex,
              currentIndex:provider.currentIndex ,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                    icon: Assets.icons.homeUnselected.svg(),
                    label: "Home",
                    activeIcon: Assets.icons.homeSelected.svg()),
                BottomNavigationBarItem(
                    icon: Assets.icons.heartUnselected.svg(),
                    label: "Favourite",
                    activeIcon: Assets.icons.heartSelected.svg()),
                BottomNavigationBarItem(
                    icon: Assets.icons.userUnselected.svg(),
                    label: "Profile",
                    activeIcon: Assets.icons.userSelected.svg())
              ]),
        ));
  }
}

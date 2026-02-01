import 'package:eventapp/Home/Favourite/FavourateScreen.dart';
import 'package:eventapp/Home/Home_screen/Home_Screen.dart';
import 'package:eventapp/Home/Profile/ProfileScreen.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:flutter/material.dart';

import '../core/gen/assets.gen.dart';

class Layoutscreen extends StatefulWidget {
  Layoutscreen({super.key});

  @override
  State<Layoutscreen> createState() => _LayoutscreenState();
}

class _LayoutscreenState extends State<Layoutscreen> {
  List<Widget> screens = [
    HomeScreen(),
    Favouratescreen(),
    Profilescreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
          backgroundColor: ColorPalette.lightMainColor,
          foregroundColor: ColorPalette.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
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
            ]));
  }
}

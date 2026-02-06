import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:eventapp/widgets/CustomListView.dart';
import 'package:eventapp/widgets/CustomStack.dart';
import 'package:flutter/material.dart';

import '../../core/gen/assets.gen.dart';
import '../../models/eventCategoryData.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<EventCategoryData> categoriesDataList = [
    EventCategoryData(
        id: "sport",
        title: "sport",
        image: "",
        imgDark: '',
        icn: Icons.sports_basketball_outlined),
    EventCategoryData(
        id: "birthday",
        title: "Birthday",
        image: "",
        imgDark: '',
        icn: Icons.cake_outlined),
    EventCategoryData(
        id: "book_club",
        title: "Book Club",
        image: Assets.icons.sportIcon.keyName,
        imgDark: '',
        icn: Icons.menu_book_outlined),
    EventCategoryData(
        id: "meeting",
        title: "Meeting",
        image: Assets.icons.sportIcon.keyName,
        imgDark: '',
        icn: Icons.meeting_room_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppSettingProvider>();
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Welcome Back ✨",
          style: textTheme.bodyMedium?.copyWith(
              color: ColorPalette.lightSecText, fontWeight: FontWeight.w400),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                context.read<AppSettingProvider>().toggleTheme();
              },
              icon: context.watch<AppSettingProvider>().isDark
                  ? Assets.icons.moon.svg()
                  : Assets.icons.sun2.svg()),
          InkWell(
            onTap: () {
              context.read<AppSettingProvider>().toggleLanguage();
            },
            child: Container(
              width: 34,
              height: 32,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: ColorPalette.lightMainColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child:
                      context.watch<AppSettingProvider>().local.languageCode ==
                              'ar'
                          ? Text(
                              "AR",
                              style: textTheme.bodyMedium,
                            )
                          : Text(
                              "EN",
                              style: textTheme.bodyMedium,
                            )),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Jone Safwat",
              style: textTheme.titleLarge?.copyWith(
                  color: ColorPalette.lightMainText,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultTabController(
              length: categoriesDataList.length,
              child: TabBar(
                padding: EdgeInsets.zero,
                onTap: provider.changeCurrentCategoryIndex,

                physics: const ClampingScrollPhysics(),
                isScrollable: true,
                indicator: const BoxDecoration(),
                dividerColor: Colors.transparent,
                //indicatorColor: Colors.transparent,
                tabs: categoriesDataList.asMap().entries.map((entry) {
                  final index = entry.key;
                  final data = entry.value;
                  return Customelistview(
                    eventCategoryData: data,
                    isSelected: provider.currentCategoryIndex == index,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const Customstack();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 5),
            )
          ],
        ),
      ),
    );
  }
}

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
        image: Assets.images.sport.keyName,
        imgDark: Assets.images.darkSport.keyName,
        icn: Icons.sports_basketball_outlined),
    EventCategoryData(
        id: "birthday",
        title: "Birthday",
        image: Assets.images.birthday.keyName,
        imgDark: Assets.images.darkBirthday.keyName,
        icn: Icons.cake_outlined),
    EventCategoryData(
        id: "book_club",
        title: "Book Club",
        image: Assets.images.bookClub.keyName,
        imgDark: Assets.images.darkBookClub.keyName,
        icn: Icons.menu_book_outlined),
    EventCategoryData(
        id: "meeting",
        title: "Meeting",
        image: Assets.images.meeting.keyName,
        imgDark: Assets.images.darkMeeting.keyName,
        icn: Icons.meeting_room_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppSettingProvider>(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    ThemeData theme=Theme.of(context);
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

              provider.themeMode == ThemeMode.light
                  ? provider.changeTheme(ThemeMode.dark)
                  : provider.changeTheme(ThemeMode.light);
            },
            icon: provider.themeMode == ThemeMode.light
                ? Assets.icons.sun2.svg()
                : Assets.icons.moon.svg(),
            color: theme.primaryColor,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage(
                  provider.currentLanguage == "ar" ? "en" : "ar");
            },
            child: Container(
              width: 34,
              height: 32,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: ColorPalette.lightMainColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: provider.currentLanguage == 'ar'
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
                tabAlignment: TabAlignment.start,
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.zero,
                onTap: provider.changeCurrentCategoryIndex,
                isScrollable: true,
                indicator: const BoxDecoration(),
                dividerColor: Colors.transparent,
                //indicatorColor: Colors.transparent,
                tabs: categoriesDataList.map((data) {

                  return Customelistview(
                    eventCategoryData: data,
                    isSelected: provider.currentCategoryIndex == categoriesDataList.indexOf(data),
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

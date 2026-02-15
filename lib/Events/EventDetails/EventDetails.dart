import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventapp/Events/addEvent/AddEvent.dart';
import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:eventapp/core/utils/firestore.dart';
import 'package:eventapp/widgets/CustomListTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../core/gen/assets.gen.dart';
import '../../models/eventCategoryData.dart';
import '../../models/event_data_model.dart';
import '../../widgets/CustomAppBar.dart';

class Eventdetails extends StatefulWidget {
  final EventDataModel event;
  Eventdetails({super.key, required this.event});

  @override
  State<Eventdetails> createState() => _EventdetailsState();
}

class _EventdetailsState extends State<Eventdetails> {
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
    TextTheme textTheme = Theme.of(context).textTheme;
    final provider = Provider.of<AppSettingProvider>(context);
    return Scaffold(
      appBar: Customappbar(
        onTap1: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Addevent(
                        event: widget.event,
                        isUpdate: true,
                      )));
        },
        onTap2: () {
          FireStoreUtils.deleteEvent(widget.event);
          Navigator.pop(context);
        },
        title: "Event details",
        showAction: true,
      ),
      body: StreamBuilder<DocumentSnapshot<EventDataModel>>(
        stream: FireStoreUtils.getSingleEventStream(widget.event.eventId!),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            snapshot.error.toString();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          EventDataModel event = snapshot.data!.data()!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  provider.themeMode == ThemeMode.light
                      ? event.categoryImg
                      : event.categoryDarkImg,
                ),
                Text(event.eventTitle,
                    style: provider.themeMode == ThemeMode.light
                        ? textTheme.bodyLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )
                        : textTheme.bodyLarge?.copyWith(
                            color: DarkColorPalette.white,
                            fontWeight: FontWeight.bold,
                          )),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: provider.themeMode == ThemeMode.light
                              ? LightColorPalette.lightStroke
                              : DarkColorPalette.darkStroke),
                      borderRadius: BorderRadius.circular(16),
                      color: provider.themeMode == ThemeMode.light
                          ? LightColorPalette.white
                          : DarkColorPalette.darkInputs),
                  child: Customlisttile(
                      leading: Icon(
                        Icons.calendar_month_outlined,
                        color: provider.themeMode == ThemeMode.light
                            ? LightColorPalette.lightMainColor
                            : DarkColorPalette.darkMainColor,
                      ),
                      titleText: DateFormat("dd MMMM").format(event.eventDate),
                      trailingText: "",
                      subtitleText: event.eventTime == null
                          ? "No time"
                          : event.eventTime!.toString(),
                      onPressed: () {}),
                ),
                Text(
                  "Description",
                  style: textTheme.bodyLarge?.copyWith(
                    color: provider.themeMode == ThemeMode.light
                        ? LightColorPalette.lightMainText
                        : DarkColorPalette.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: provider.themeMode == ThemeMode.light
                              ? LightColorPalette.lightStroke
                              : DarkColorPalette.darkStroke),
                      borderRadius: BorderRadius.circular(16),
                      color: provider.themeMode == ThemeMode.light
                          ? LightColorPalette.white
                          : DarkColorPalette.darkInputs),
                  child: Text(
                    event.eventDescription,
                    style: textTheme.bodyLarge?.copyWith(
                      color:provider.themeMode==ThemeMode.light? LightColorPalette.lightMainText:DarkColorPalette.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:eventapp/core/utils/firestore.dart';
import 'package:eventapp/models/event_data_model.dart';
import 'package:flutter/material.dart';

import '../../core/gen/assets.gen.dart';
import '../../models/eventCategoryData.dart';
import '../../widgets/CustemTextformField.dart';
import '../../widgets/CustomStack.dart';

class Favouratescreen extends StatelessWidget {
   Favouratescreen({super.key});
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
    TextTheme textTheme=Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Custemtextformfield(
                hintText: 'Search for events',
                obscureText: false,
                suffixIcon: const Icon(Icons.search),
              ),
              const SizedBox(height: 20,),
              StreamBuilder(
                  stream: FireStoreUtils.getStreamFavouriteData(
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                        snapshot.error.toString(),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    snapshot.data!.docs.map((e) {
                      return e.data();
                    }).toList();
                    List<EventDataModel> dataList = snapshot.data!.docs.map((e) {
                      return e.data();
                    }).toList();
                    return dataList.isEmpty
                        ? Center(
                        child: Text(
                          "No Data Found",
                          style: textTheme.titleMedium,
                        ))
                        : Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Customstack(
                              dataModel: dataList[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: dataList.length),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

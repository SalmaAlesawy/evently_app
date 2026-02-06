import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:eventapp/widgets/CustomAppBar.dart';
import 'package:eventapp/widgets/CustomElevatedButton.dart';
import 'package:eventapp/widgets/CustomListTile.dart';
import 'package:flutter/material.dart';

import '../../core/gen/assets.gen.dart' show Assets;
import '../../widgets/CustemTextformField.dart';
import '../../widgets/CustomListView.dart';

class Addevent extends StatelessWidget {
  const Addevent({super.key});

  @override
  Widget build(BuildContext context) {
    AppSettingProvider provider=AppSettingProvider();
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const Customappbar(
        title: "Add event",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Assets.images.bookClub.image(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>  Customelistview(eventCategoryData:provider.categoriesDataList[1], isSelected: true,),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                  itemCount: 5),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Title",
              style: textTheme.titleMedium?.copyWith(
                  color: ColorPalette.lightMainText,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Custemtextformfield(
              hintText: 'Event Title',
              obscureText: false,
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Description",
                style: textTheme.titleMedium?.copyWith(
                    color: ColorPalette.lightMainText,
                    fontWeight: FontWeight.w500)),
            Custemtextformfield(
              hintText: 'Event Description',
              obscureText: false,
              maxLines: 6,
            ),
            const Customlisttile(
              leading: Icon(Icons.calendar_month_outlined),
              titleText: 'Event Date',
              trailingText: 'Choose data',
            ),
            SizedBox(height: 10,),
            const Customlisttile(
              leading: Icon(Icons.calendar_month_outlined),
              titleText: 'Event Time',
              trailingText: 'Choose time',
            ),
            SizedBox(height: 30,),
            const Customelevatedbutton(buttonText: "Add event")
          ],
        ),
      ),
    );
  }
}

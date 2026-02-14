import 'package:eventapp/app_setting_provider/app_setting_provider.dart';
import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:eventapp/core/utils/firestore.dart';
import 'package:eventapp/models/event_data_model.dart';
import 'package:eventapp/widgets/CustomAppBar.dart';
import 'package:eventapp/widgets/CustomElevatedButton.dart';
import 'package:eventapp/widgets/CustomListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

import '../../core/gen/assets.gen.dart' show Assets;
import '../../models/eventCategoryData.dart';
import '../../widgets/CustemTextformField.dart';
import '../../widgets/CustomListView.dart';

class Addevent extends StatefulWidget {
  Addevent({super.key,  this.event,  this.isUpdate=false});
final EventDataModel? event;
final bool isUpdate;
  @override
  State<Addevent> createState() => _AddeventState();
}

class _AddeventState extends State<Addevent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text=widget.event!.eventTitle;
    descriptionController.text=widget.event!.eventDescription;
  }
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
  int _currentIndex = 0;
  late DateTime? selectedEventDate=widget.event!.eventDate;
  late TimeOfDay? selectedEventTime=widget.event!.eventTime;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const Customappbar(
        title: "Add event",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image(image: AssetImage(categoriesDataList[_currentIndex].image)),
              const SizedBox(
                height: 20,
              ),
              DefaultTabController(
                length: categoriesDataList.length,
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.zero,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  isScrollable: true,
                  indicator: const BoxDecoration(),
                  dividerColor: Colors.transparent,
                  //indicatorColor: Colors.transparent,
                  tabs: categoriesDataList.map((data) {
                    return Customelistview(
                      eventCategoryData: data,
                      isSelected:
                          _currentIndex == categoriesDataList.indexOf(data),
                    );
                  }).toList(),
                ),
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
                controller: titleController,
                hintText: 'Event Title',
                obscureText: false,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter title";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Description",
                  style: textTheme.titleMedium?.copyWith(
                      color: ColorPalette.lightMainText,
                      fontWeight: FontWeight.w500)),
              Custemtextformfield(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter description";
                  }
                  return null;
                },
                controller: descriptionController,
                hintText: 'Event Description',
                obscureText: false,
                maxLines: 6,
              ),
              Customlisttile(
                onPressed: () {
                  getSelectedDate();
                },
                leading: const Icon(Icons.calendar_month_outlined),
                titleText: 'Event Date',
                trailingText: selectedEventDate != null
                    ? (DateFormat("dd, MMM yyyy").format(selectedEventDate!))
                    : widget.event?.eventDate!=null? (DateFormat("dd, MMM yyyy").format(widget.event!.eventDate)):
                    "Choose data"
              ),
              const SizedBox(
                height: 10,
              ),
              Customlisttile(
                onPressed: (){
                  getSelectedTime();
                },
                leading: const Icon(Icons.access_time_outlined),
                titleText: 'Event Time',
                trailingText: selectedEventTime != null
                    ? selectedEventTime!.format(context)
                    : widget.event?.eventTime!=null? widget.event?.eventTime!.format(context)??"" :"Choose time"
              ),
              const SizedBox(
                height: 10,
              ),
              widget.isUpdate==false?
              Customelevatedbutton(
                buttonText: "Add event",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    EasyLoading.show();
                    EventDataModel data = EventDataModel(
                        eventTime: selectedEventTime!,
                        isFavorite: false,
                        eventTitle: titleController.text,
                        eventDescription: descriptionController.text,
                        eventDate: selectedEventDate!,
                        eventCategoryId: categoriesDataList[_currentIndex].id,
                        categoryImg: categoriesDataList[_currentIndex].image,
                        categoryDarkImg: categoriesDataList[_currentIndex].imgDark);


                    bool value= await FireStoreUtils.addEvent(data);
                    EasyLoading.dismiss();
                    if (value) {
                      toastification.show(
                          title: const Text("Event added successfully"),
                          autoCloseDuration: const Duration(seconds: 2),
                          type: ToastificationType.success,
                          alignment: Alignment.center);
                      Navigator.pop(context);
                    } else {
                      toastification.show(
                          title:
                          const Text("Event have not added successfully"),
                          autoCloseDuration: const Duration(seconds: 2),
                          type: ToastificationType.error,
                          alignment: Alignment.center);
                    }
                  }
                },
              ):
              Customelevatedbutton(
                buttonText: "Update Event",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    EasyLoading.show() ;
                    EventDataModel data = EventDataModel(
                      eventId: widget.event?.eventId,
                        eventTime: selectedEventTime,
                        isFavorite: false,
                        eventTitle: titleController.text,
                        eventDescription: descriptionController.text,
                        eventDate: selectedEventDate!,
                        eventCategoryId: categoriesDataList[_currentIndex].id,
                        categoryImg: categoriesDataList[_currentIndex].image,
                        categoryDarkImg:
                        categoriesDataList[_currentIndex].imgDark);


                    bool value= await FireStoreUtils.updateEvent(data);
                    EasyLoading.dismiss();
                    if (value) {
                      toastification.show(
                          title: const Text("Event updated successfully"),
                          autoCloseDuration: const Duration(seconds: 2),
                          type: ToastificationType.success,
                          alignment: Alignment.center);
                      Navigator.pop(context);
                    } else {
                      toastification.show(
                          title:
                          const Text("Event have not updated successfully"),
                          autoCloseDuration: const Duration(seconds: 2),
                          type: ToastificationType.error,
                          alignment: Alignment.center);
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void getSelectedDate() async {
    var currentDateTime = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 265)));

    setState(() {
      selectedEventDate = currentDateTime;
    });
  }

  void getSelectedTime() async {
    final TimeOfDay? timeOfDay =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (timeOfDay != null) {
      setState(() {
        selectedEventTime = timeOfDay;
      });
    }
  }
}

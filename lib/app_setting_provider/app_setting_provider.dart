import 'package:eventapp/models/eventCategoryData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/gen/assets.gen.dart';

class AppSettingProvider extends ChangeNotifier {
  int _currentIndex=0;
  int get currentIndex=> _currentIndex;
  void changeCurrentIndex(int value){
    if(_currentIndex!=value){
      _currentIndex=value;
      notifyListeners();
    }
  }
   ThemeMode themeMode = ThemeMode.light;
  String currentLanguage = "en";
  void changeLanguage(String newLanguage) {
    if(newLanguage==currentLanguage)return;
    currentLanguage = newLanguage;
    notifyListeners();
  }
  void setEnglish(){
    currentLanguage="en";
    notifyListeners();
  }
  void setArabic(){
    currentLanguage="ar";
    notifyListeners();
  }

  void changeTheme(newTheme) {
    if(newTheme==themeMode) return;

    themeMode=newTheme;

    notifyListeners();
  }

  void setLight(){
    themeMode=ThemeMode.light;
    notifyListeners();
  }
  void setDark(){
    themeMode=ThemeMode.dark;
    notifyListeners();
  }

  int _currentCategoryIndex = 0;
  int get currentCategoryIndex => _currentCategoryIndex;
  void changeCurrentCategoryIndex(int index) {
    _currentCategoryIndex = index;
    notifyListeners();
  }

  List<EventCategoryData> get categoriesDataList => [
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

  String name="";
  String email="";
  Future<void> loadUserData()async{
    var user=FirebaseAuth.instance.currentUser;
    name=user?.displayName??"";
    email=user?.email??"";
    notifyListeners();
  }
}

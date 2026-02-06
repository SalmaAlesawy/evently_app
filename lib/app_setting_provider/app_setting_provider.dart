import 'package:eventapp/models/eventCategoryData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/gen/assets.gen.dart';

class AppSettingProvider extends ChangeNotifier {
  static ThemeMode themeMode = ThemeMode.light;
  bool get isDark => themeMode == ThemeMode.dark;
  Locale _locale = const Locale("en");
  Locale get local => _locale;
  void toggleLanguage() {
    _locale =
        _locale.languageCode == 'en' ? const Locale('ar') : const Locale('en');
    notifyListeners();
  }

  void setLocal(Locale local) {
    _locale = local;
    notifyListeners();
  }

  void setEnglish() => setLocal(const Locale("en"));
  void setArabic() => setLocal(const Locale("ar"));
  void toggleTheme() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setLight() {
    themeMode = ThemeMode.light;
    notifyListeners();
  }

  void setDark() {
    themeMode = ThemeMode.dark;
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
}

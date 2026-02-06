import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventCategoryData {
  final String id;
  final String title;
  final String image;
  final String imgDark;
  final IconData icn;

  EventCategoryData({
    required this.id,
    required this.title,
    required this.image,
    required this.imgDark,
    required this.icn,
  });
}

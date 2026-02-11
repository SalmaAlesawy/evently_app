import 'package:eventapp/models/eventCategoryData.dart';
import 'package:flutter/material.dart';

import '../core/theme/ColorPalette.dart';

class Customelistview extends StatelessWidget {
  final bool isSelected;
  const Customelistview({
    super.key,
    required this.eventCategoryData,
    required this.isSelected,
  });
  final EventCategoryData eventCategoryData;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isSelected ? ColorPalette.lightMainColor : ColorPalette.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          Icon(
            eventCategoryData.icn,
            color:
                isSelected ? ColorPalette.white : ColorPalette.lightMainColor,
          ),
          Text(
            eventCategoryData.title,
            style: textTheme.titleMedium?.copyWith(
                color: isSelected
                    ? ColorPalette.white
                    : ColorPalette.lightMainText),
          ),
        ],
      ),
    );
  }
}

import 'package:eventapp/core/utils/firestore.dart';
import 'package:eventapp/models/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/gen/assets.gen.dart';
import '../core/theme/ColorPalette.dart';

class Customstack extends StatefulWidget {
   EventDataModel dataModel;
  Customstack({super.key, required this.dataModel});

  @override
  State<Customstack> createState() => _CustomstackState();
}

class _CustomstackState extends State<Customstack> {
  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        Image(image: AssetImage(widget.dataModel.categoryImg)),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            width: 70,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorPalette.lightBackGround,
            ),
            child: Text(
              DateFormat("dd MMM").format(widget.dataModel.eventDate),
              style: textTheme.titleMedium?.copyWith(
                  color: ColorPalette.lightMainColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: ColorPalette.lightBackGround,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.dataModel.eventDescription,
                  style: textTheme.bodyMedium?.copyWith(
                      color: ColorPalette.lightMainText,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: (){
                    widget.dataModel.isFavorite=!widget.dataModel.isFavorite;
                   FireStoreUtils.updateEvent(widget.dataModel);
                    },
                    child: widget.dataModel.isFavorite
                        ? Assets.icons.heartSelected.svg()
                        : Assets.icons.heartUnselected.svg())
              ],
            ),
          ),
        ),
      ],
    );
  }
}

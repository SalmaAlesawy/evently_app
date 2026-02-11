class EventDataModel {
  static const String collectionName = "EventCollection";
   String? eventId;
  final String eventTitle;
  final String eventDescription;
  final DateTime eventDate;
  final String eventCategoryId;
  final String categoryImg;
  final String categoryDarkImg;
  final bool? isFavorite;

  EventDataModel(
      {this.eventId,
      required this.eventTitle,
      required this.eventDescription,
      required this.eventDate,
      required this.eventCategoryId,
      required this.categoryImg,
      required this.categoryDarkImg,
      this.isFavorite = false});

  factory EventDataModel.fromFireStore(
    Map<String, dynamic> json,
  ) {
    return EventDataModel(
        eventId: json["eventId"],
        eventTitle: json["eventTitle"],
        eventDescription: json["eventDescription"],
        eventDate: DateTime.fromMillisecondsSinceEpoch(json["eventDate"]),
        eventCategoryId: json["eventCategoryId"],
        categoryImg: json["categoryImg"],
        categoryDarkImg: json["categoryDarkImg"],
        isFavorite: json["isFavorite"]);
  }

  Map<String, dynamic> toFireStore() {
    return {
      "eventId": eventId,
      "eventTitle": eventTitle,
      "eventDescription": eventDescription,
      "eventDate": eventDate.millisecondsSinceEpoch,
      "eventCategoryId": eventCategoryId,
      "categoryImg": categoryImg,
      "categoryDarkImg": categoryDarkImg,
      "isFavorite": isFavorite
    };
  }
}

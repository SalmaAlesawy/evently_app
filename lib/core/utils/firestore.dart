import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/event_data_model.dart';

///1- handling loading
///2-read data from fire store
abstract class FireStoreUtils {
  static CollectionReference<EventDataModel> getCollectionRef() {
    return FirebaseFirestore.instance
        .collection(EventDataModel.collectionName)
        .withConverter<EventDataModel>(
            fromFirestore: (snapshot, _) =>
                EventDataModel.fromFireStore(snapshot.data()!),
            toFirestore: (value, _) => value.toFireStore());

    ///Map
  }

  static Future<bool> addEvent(EventDataModel data) async {
    try {
      CollectionReference<EventDataModel> collectionRef = getCollectionRef();
      var docRef = collectionRef.doc();
      data.eventId = docRef.id;
      await docRef.set(data);
      return true;
    } catch (error) {
      print("Add event error: $error");
      print(StackTrace);
      return false;
    }
  }

  static Future<List<EventDataModel>> getDataFromFireStore() async {
    var collectionRef = getCollectionRef();
    List<EventDataModel> eventList = [];
    var data = await collectionRef.get();
    data.docs.map((element) {
      eventList.add(element.data());
    });
    return eventList;
  }

  static Stream<QuerySnapshot<EventDataModel>> getStreamDataFromFireStore(
      String categoryId) {
    var collectionRef = getCollectionRef().where(
      //from data base
      "eventCategoryId",
      //the value entered
      isEqualTo: categoryId,
    );
    return collectionRef.snapshots();
  }

  static Stream<DocumentSnapshot<EventDataModel>> getSingleEventStream(
      String eventId) {
    return getCollectionRef().doc(eventId).snapshots();
  }

  static Stream<QuerySnapshot<EventDataModel>> getStreamFavouriteData() {
    var collectionRef = getCollectionRef().where("isFavorite", isEqualTo: true);
    return collectionRef.snapshots();
  }

  static Future<bool> updateEvent(EventDataModel event) async {
    try {
      print("Event Id ${event.eventId}");
      CollectionReference collectionReference = getCollectionRef();
      var docRef = collectionReference.doc(event.eventId);
      await docRef.update(event.toFireStore());
      return true;
    } catch (error) {
      return false;
    }
  }

  static Future<void> deleteEvent(EventDataModel data) async {
    CollectionReference collectionReference = getCollectionRef();
    var docRef = collectionReference.doc(data.eventId);
    docRef.delete();
  }
}

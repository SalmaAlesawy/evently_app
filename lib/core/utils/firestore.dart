import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/event_data_model.dart';

abstract class FireStoreUtils {

 static CollectionReference<EventDataModel> getCollectionRef() {
    return FirebaseFirestore.instance
        .collection(EventDataModel.collectionName)
        .withConverter<EventDataModel>(fromFirestore: (snapshot, _) =>
      EventDataModel.fromFireStore(snapshot.data()!)
    , toFirestore: (value,_) =>
      value.toFireStore()
    );


    ///Map
  }

 static Future<void> addEvent(EventDataModel data)async{
    CollectionReference collectionRef=getCollectionRef();
    var docRef= collectionRef.doc();
    data.eventId=docRef.id;
    docRef.set(data);
  }

}

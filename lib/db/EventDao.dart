import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/db/model/Event.dart';

class EventDao {
  static final _db = FirebaseFirestore.instance;

  static CollectionReference<Event> _getEventsByCollection() {
    return _db
        .collection("Events")
        .withConverter(
          fromFirestore: (snapshot, options) => Event.fromMap(snapshot.data()),
          toFirestore: (event, options) => event.toMap(),
        );
  }

  static Future<void> addEvent(Event event) async {
    var doc = _getEventsByCollection().doc();
    event.id = doc.id;
    await doc.set(event);
  }

  static Future<List<Event>> getEvents() async {
    var collectionRef = await _getEventsByCollection().get();
    return collectionRef.docs.map((snapShot) => snapShot.data()).toList();
  }

}

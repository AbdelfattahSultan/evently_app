
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

  static Future<List<Event>> getEvents(int? categoryId) async {
    Query<Event> query = _getEventsByCollection();
    if (categoryId != null) {
      query = query.where("categoryId", isEqualTo: categoryId);
    }
    query = query
        .orderBy("dateTime", descending: false)
        .orderBy("timeOfDay", descending: false);

    var collectionRef = await query.get();
    return collectionRef.docs.map((snapShot) => snapShot.data()).toList();
  }

  static Future<List<Event>> getFavoriteEvents(
    int? categoryId,
    List<String> eventIds,
  ) async {
    if (eventIds.isEmpty) {
      return [];
    }
    Query<Event> query = _getEventsByCollection().where(
      FieldPath.documentId,
      whereIn: eventIds,
    );
    if (categoryId != null) {
      query = query.where("categoryId", isEqualTo: categoryId);
    }
    query = query
        .orderBy("dateTime", descending: false)
        .orderBy("timeOfDay", descending: false);

    var collectionRef = await query.get();
    return collectionRef.docs.map((snapShot) => snapShot.data()).toList();
  }

  static Stream<List<Event>> getRealTimeUpdateEvents(int? categoryId) async* {
    Query<Event> query = _getEventsByCollection();

    if (categoryId != null) {
      query = query.where("categoryId", isEqualTo: categoryId);
    }

    query = query
        .orderBy("dateTime", descending: false)
        .orderBy("timeOfDay", descending: false);

    var collectionRef = query.snapshots();

    yield* collectionRef.map(
      (snapShot) => snapShot.docs.map((snapShot) => snapShot.data()).toList(),
    );
  }

  
}

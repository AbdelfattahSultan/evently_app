import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/db/AppUser.dart';

class UserDao {
  static final _db = FirebaseFirestore.instance;

  static CollectionReference<AppUser> _getUsersByCollection() {
    return _db
        .collection("users")
        .withConverter(
          fromFirestore: (snapshot, options) =>
              AppUser.fromMap(snapshot.data()),
          toFirestore: (user, options) => user.toMap(),
        );
  }

  static Future<void> addUser(AppUser user) async {
    var docReference = _getUsersByCollection().doc(user.id);
    await docReference.set(user);
  }

  static Future<AppUser?> getUserById(String? userId) async {
    var document = await _getUsersByCollection().
    doc(userId).get();
    return document.data();
  }
}

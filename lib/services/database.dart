import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:health_aid_app/models/reminder.dart';
import 'dart:async';
import 'global_service.dart';

// class Document<T> {
//   final Firestore _db = Firestore.instance;
//   final String path;
//   DocumentReference ref;

//   Document({this.path}) {
//     ref = _db.document(path);
//   }

//   Future<T> getData() {
//     return ref.get().then((v) => Global.models[T](v.data) as T);
//   }

//   Stream<T> streamData() {
//     return ref.snapshots().map((v) => Global.models[T](v.data) as T);
//   }

//   Future<void> upsert(Map data) {
//     return ref.setData(Map<String, dynamic>.from(data), merge: true);
//   }
// }

class DatabaseService {
  final Firestore firestoreRef = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();

  FirebaseUser user;
  DatabaseService({this.user});

  saveDeviceToken() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    String _fcmToken = await _fcm.getToken();

    if (_fcmToken != null) {
      var tokenRef = firestoreRef
          .collection('USERS')
          .document(user.uid)
          .collection('tokens')
          .document(_fcmToken);

      await tokenRef.setData({
        'token': [_fcmToken],
        'device': Platform.operatingSystem,
        'createdAt': FieldValue.serverTimestamp(),
        'device_name': Platform.localeName,
      }, merge: true);
    }
  }

  Future<void> createDoc(String path, Map<String, dynamic> data) async {
    var ref = firestoreRef.document(path);

    return ref.setData(data);
  }

  Future<void> createDoc2(String collection, Map<String, dynamic> data) async {
    var ref = firestoreRef.collection(collection).document();

    return ref.setData(data);
  }

  Stream<List<REMINDER>> getReminders() {
    var ref = firestoreRef.collection('REMINDERS');

    return ref.snapshots().map((event) =>
        event.documents.map((e) => REMINDER.fromFirestore(e)).toList());
  }
}
// 233500065504

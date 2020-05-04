// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:groupquiz/models/quiz_models.dart';

// /// Static global state. Immutable services that do not care about build context.
// class Global {
//   // App Data
//   static final String title = 'eLearning';

//   // Services

//   // Data Models
//   static final Map models = {
//     TOPIC: (data) => TOPIC.fromMap(data),
//     QUIZ: (data) => QUIZ.fromMap(data),
//     REPORT: (data) => REPORT.fromMap(data),
//   };

//   // Firestore References for Writes
//   static final Collection<TOPIC> topicsRef = Collection<TOPIC>(path: 'topics');
//   // static final UserData<Report> reportRef = UserData<Report>(collection: 'reports');

// }

// class Collection<T> {
//   final Firestore _db = Firestore.instance;
//   final String path;
//   CollectionReference ref;

//   Collection({this.path}) {
//     ref = _db.collection(path);
//   }

//   Future<List<T>> getData() async {
//     var snapshots = await ref.getDocuments();
//     return snapshots.documents
//         .map((doc) => Global.models[T](doc.data) as T)
//         .toList();
//   }

//   Stream<List<T>> streamData() {
//     return ref.snapshots().map(
//         (list) => list.documents.map((doc) => Global.models[T](doc.data) as T));
//   }
// }

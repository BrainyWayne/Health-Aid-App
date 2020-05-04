import 'package:cloud_firestore/cloud_firestore.dart';

class REMINDER {
  String id;
  String name;
  String numberOfTimes;
  String time;
  double dose;
  Timestamp start;
  Timestamp end;

  REMINDER({
    this.id,
    this.name,
    this.numberOfTimes,
    this.time,
    this.dose,
    this.start,
    this.end,
  });

  factory REMINDER.fromFirestore(DocumentSnapshot snap) {
    var data = snap.data;
    return REMINDER(
      id: snap.documentID,
      name: data['name'],
      numberOfTimes: data['numberOfTimes'],
      time: data['time'],
      dose: data['dose'],
      start: data['start'],
      end: data['end'],
    );
  }

  toMap() => {
        'id': id,
        'name': name,
        'numberOfTimes': numberOfTimes,
        'time': time,
        'dose': dose,
        'start': start,
        'end': end,
      };
}

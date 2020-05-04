import 'package:cloud_firestore/cloud_firestore.dart';

class DOCTOR {
  String id;
  String name;
  String title;
  double years;
  String hospital;
  List<String> specialities;
  String profile;
  CONTACT contact;

  DOCTOR({
    this.id,
    this.name,
    this.title,
    this.profile,
    this.years,
    this.hospital,
    this.specialities,
    this.contact,
  });

  factory DOCTOR.fromFirestore(DocumentSnapshot snap) {
    var data = snap.data;

    return DOCTOR(
      id: snap.documentID,
      name: data['name'],
      title: data['title'],
      years: data['years'],
      hospital: data['hospital'],
      specialities: List.from(data['specialities']),
      profile: data['profile'],
      contact: CONTACT(
        location: data['contact']['location'],
        phone: data['contact']['phone'],
        email: data['contact']['email'],
        coords: data['contact']['coords'],
      ),
    );
  }

  toMap() => {
        'name': name,
        'title': title,
        'years': years,
        'hospital': hospital,
        'specialities': specialities,
        'profile': profile,
        'contact': contact.toMap(),
      };
}

class CONTACT {
  String location;
  String phone;
  String email;
  GeoPoint coords;
  CONTACT({
    this.location,
    this.phone,
    this.email,
    this.coords,
  });

  toMap() => {
        'location': location,
        'phone': phone,
        'email': email,
        'coords': coords,
      };
}

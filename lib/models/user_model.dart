import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_aid_app/models/metadata_model.dart';

class USER {
  String id;
  String name;
  String email;
  String gender;
  Timestamp dateOfBirth;
  String specialConditions;
  METADATA metadata;

  USER(
      {this.id,
      this.name,
      this.email,
      this.gender,
      this.dateOfBirth,
      this.specialConditions,
      this.metadata});

  factory USER.formFirestore(DocumentSnapshot snap) {
    var data = snap.data;

    return USER(
      id: snap.documentID,
      name: data['name'],
      email: data['email'],
      gender: data['gender'],
      dateOfBirth: data['dateOfBirth'],
      specialConditions: data['specialConditions'],
      metadata: METADATA(
        exists: snap.exists,
        fromCache: snap.metadata.isFromCache,
        ref: snap.reference,
      ),
    );
  }

  toMap() => {
        'name': name,
        'email': email,
        'gender': gender,
        'dateOfBirth': dateOfBirth,
        'specialConditions': specialConditions,
      };
}

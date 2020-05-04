import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:health_aid_app/models/doctor_model.dart';
import 'package:health_aid_app/models/hospital_model.dart';
import 'package:health_aid_app/models/menu_model.dart';

class TestData {
  List<MENU> menu = [
    MENU(
      title: 'Find Doctor',
      icon: Icons.person_pin,
      path: '/find_doctor',
    ),
    MENU(
      title: 'Find Hospital',
      icon: Icons.local_hospital,
      path: '/find_hospital',
    ),
    MENU(
      title: 'Emergency',
      icon: Icons.error,
      path: '/emergency',
    ),
    MENU(
      title: 'Check Well-being',
      icon: Icons.verified_user,
      path: '/well_being',
    ),
    MENU(
      title: 'Meds Reminder',
      icon: EvaIcons.bookmark,
      path: '/reminder',
    ),
    MENU(
      title: 'Profile',
      icon: EvaIcons.person,
      path: '/profile',
    ),
  ];

  List<DOCTOR> doctors = [
    DOCTOR(
      name: 'Doctor One',
      hospital: 'Hospital One',
      title: 'Snr Doctor',
      profile:
          'https://images.theconversation.com/files/304957/original/file-20191203-66986-im7o5.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=926&fit=clip',
      specialities: [
        'Heart',
        'Lungs',
      ],
      years: 3.4,
      contact: CONTACT(
        coords: GeoPoint(00, 0),
        email: 'someehre@gmail.com',
        location: 'Manpong',
        phone: '0000000000',
      ),
    ),
    DOCTOR(
      name: 'Doctor Two',
      hospital: 'Hospital Two',
      title: 'jnr Doctor',
      profile:
          'https://image.freepik.com/free-photo/doctor-smiling-with-stethoscope_1154-36.jpg',
      specialities: [
        'Heart',
        'Lungs',
      ],
      years: 3.4,
      contact: CONTACT(
        coords: GeoPoint(00, 0),
        email: 'someehre@gmail.com',
        location: 'Manpong',
        phone: '0000000000',
      ),
    ),
    DOCTOR(
      name: 'Doctor Three',
      hospital: 'Hospital Three',
      title: 'Spc Doctor',
      profile:
          'https://www.franklinhealthclinic.ca/wp-content/uploads/2020/03/doctor-img2.png',
      specialities: [
        'Heart',
        'Lungs',
      ],
      years: 3.4,
      contact: CONTACT(
        coords: GeoPoint(00, 0),
        email: 'someehre@gmail.com',
        location: 'Manpong',
        phone: '0000000000',
      ),
    ),
    DOCTOR(
      name: 'Doctor Four',
      hospital: 'Hospital Four',
      title: 'Snr Doctor',
      profile:
          'https://purepng.com/public/uploads/medium/purepng.com-doctorsdoctorsdoctors-and-nursesa-qualified-practitioner-of-medicine-aclinicianmedical-practitionermale-doctor-1421526856715dakxl.png',
      specialities: [
        'Heart',
        'Lungs',
      ],
      years: 3.4,
      contact: CONTACT(
        coords: GeoPoint(00, 0),
        email: 'someehre@gmail.com',
        location: 'Manpong',
        phone: '0000000000',
      ),
    ),
  ];

  List<HOSPITAL> hospitals = [
    HOSPITAL(
      image: '',
      name: 'Hospital One',
      specialization: [
        'Cancer',
        'Diease 2',
        'Diease 3',
        'Diease 4',
      ],
      contact: CONTACT(
        coords: GeoPoint(00, 0),
        email: 'someehre@gmail.com',
        location: 'Manpong',
        phone: '0000000000',
      ),
    ),
    HOSPITAL(
      image: '',
      name: 'Hospital Two',
      specialization: [
        'Cancer',
        'Diease 2',
        'Diease 3',
        'Diease 4',
      ],
      contact: CONTACT(
        coords: GeoPoint(00, 0),
        email: 'someehre@gmail.com',
        location: 'Manpong',
        phone: '0000000000',
      ),
    ),
    HOSPITAL(
      image: '',
      name: 'Hospital Three',
      specialization: [
        'Cancer',
        'Diease 2',
        'Diease 3',
        'Diease 4',
      ],
      contact: CONTACT(
        coords: GeoPoint(00, 0),
        email: 'someehre@gmail.com',
        location: 'Manpong',
        phone: '0000000000',
      ),
    ),
  ];
}

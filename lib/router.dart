import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health_aid_app/pages/about_us/about_us.dart';
import 'package:health_aid_app/pages/emergency/emergency.dart';
import 'package:health_aid_app/pages/find_doctor/doctor_details.dart';
import 'package:health_aid_app/pages/find_doctor/find_doctor.dart';
import 'package:health_aid_app/pages/find_hospital/find_hospital.dart';
import 'package:health_aid_app/pages/find_hospital/hospital_details.dart';
import 'package:health_aid_app/pages/healthtip.dart';
import 'package:health_aid_app/pages/home/home.dart';
import 'package:health_aid_app/pages/login/login.dart';
import 'package:health_aid_app/pages/notification/notifications.dart';
import 'package:health_aid_app/pages/profile/profile.dart';
import 'package:health_aid_app/pages/records/records.dart';
import 'package:health_aid_app/pages/reminder/reminder.dart';
import 'package:health_aid_app/pages/signup/signup.dart';
import 'package:health_aid_app/pages/well_being/well_being.dart';
import 'package:health_aid_app/root.dart';

class Router {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    var name = settings.name;
    var args = settings.arguments;

    PageRoute<dynamic> platformRoute(Widget page, {bool dialog = false}) {
      if (page == null) {
        AssertionError('Route cant not be null');
      }

      if (kIsWeb) {
        return CupertinoPageRoute(
            builder: (_) => page, fullscreenDialog: dialog);
      } else {
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => page, fullscreenDialog: dialog)
            : MaterialPageRoute(builder: (_) => page, fullscreenDialog: dialog);
      }
    }

    switch (name) {
      case '/':
        return platformRoute(Root());
      case '/login':
        return platformRoute(Login());
      case '/signup':
        return platformRoute(SignUp());
      case '/home':
        return platformRoute(Home());
      case '/notifications':
        return platformRoute(Notifications());

      case '/health_tips':
        return platformRoute(HealthTip());

      case '/find_doctor':
        return platformRoute(FindDoctor());
      case '/doctor_details':
        return platformRoute(DoctorDetails(doctor: args));
      case '/find_hospital':
        return platformRoute(FindHospital());
      case '/hospital_details':
        return platformRoute(HospitalDetails(hospital: args));
      case '/profile':
        return platformRoute(Profile());
      case '/well_being':
        return platformRoute(WellBeing());
      case '/reminder':
        return platformRoute(Reminder());
      case '/emergency':
        return platformRoute(Emergency());
      case '/records':
        return platformRoute(Records());
      case '/about_us':
        return platformRoute(AboutUs());
      default:
        return platformRoute(ErrorWidget('Page Not Found'));
    }
  }
}

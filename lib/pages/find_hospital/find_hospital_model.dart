import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_aid_app/data/data.dart';
import 'package:health_aid_app/locator.dart';
import 'package:health_aid_app/models/base_model.dart';
import 'package:health_aid_app/models/doctor_model.dart';
import 'package:health_aid_app/services/navigation_service.dart';

class FindHospitalModel extends BaseModel {
  TestData data = locator.get<TestData>();
  NavigationService _nav = locator.get<NavigationService>();
  final ScrollController controller = ScrollController();
  toDetails(DOCTOR doctor) {
    _nav.navigateTo('/doctor_details', args: doctor);
  }

  bool tile2 = false;
  bool tile3 = false;
  bool tile1 = false;

  openTile(int index, bool state) {
    switch (index) {
      case 0:
        tile1 = !state;
        notifyListeners();
        break;
      case 1:
        tile2 = !state;
        notifyListeners();
        break;
      case 2:
        tile3 = !state;
        notifyListeners();
        break;
      default:
        tile1 = !state;
        notifyListeners();
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_aid_app/locator.dart';
import 'package:health_aid_app/models/base_model.dart';
import 'package:health_aid_app/services/database.dart';
import 'package:health_aid_app/util/flushbar.dart';

class WellBeingModel extends BaseModel {
  DatabaseService _db = locator.get<DatabaseService>();
  TextEditingController controller = TextEditingController();
  Toaster _toast = locator.get<Toaster>();

  sendFeedback(FirebaseUser user) {
    _db.createDoc('FEEDBACK/${user.uid}', {
      'email': controller.text,
      'email2': user.email,
    });
    _toast.successToast(msg: 'Request sent');
  }
}

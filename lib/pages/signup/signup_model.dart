import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_aid_app/locator.dart';
import 'package:health_aid_app/models/base_model.dart';
import 'package:health_aid_app/models/user_model.dart';
import 'package:health_aid_app/services/database.dart';
import 'package:health_aid_app/services/firebase_auth.dart';
import 'package:health_aid_app/services/navigation_service.dart';
import 'package:health_aid_app/shared/picker.dart';
import 'package:health_aid_app/util/flushbar.dart';
import 'package:intl/intl.dart';

class SignupModel extends BaseModel {
  Picker picker = locator.get<Picker>();
  Toaster _toast = locator.get<Toaster>();
  Auth _auth = locator.get<Auth>();
  NavigationService _nav = locator.get<NavigationService>();
  DatabaseService _db = locator.get<DatabaseService>();

  bool _autoValidate = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  USER user = USER();

  var dateformat = DateFormat.yMMMMd();

  bool _agreedTerms = false;
  bool get agreedTerms => _agreedTerms;
  set agreedTerms(bool agreedTerms) {
    _agreedTerms = agreedTerms;
    notifyListeners();
  }

  List<String> sexs = [
    'Male',
    'Female',
    'Prefer not to say',
  ];

  String _sex;
  String get sex => _sex;
  set selectedSex(String sex) {
    _sex = sex;
    notifyListeners();
  }

  bool get autoValidate => _autoValidate;
  set autoValidate(bool autoValidate) {
    _autoValidate = autoValidate;
    notifyListeners();
  }

  setDate(DateTime date, BuildContext context) {
    dateController.text = dateformat.format(date);
    user.dateOfBirth = Timestamp.fromDate(date);
  }

  signUp() async {
    formKey.currentState.save();
    if (!agreedTerms) {
      _toast.errorToast(msg: 'Accept Terms & Conditions');
    }
    if (formKey.currentState.validate() && !loading) {
      loading = true;
      autoValidate = true;
      await _auth
          .signUp(user.email, passwordController.text)
          .then((value) async {
            await _auth.updateUserProfile(displayName: user.name);
            await _db.createDoc('USERS/${value.uid}', user.toMap());
            return _nav.moveTo('/home');
          })
          .catchError((err) => _toast.errorToast(msg: err.message))
          .whenComplete(() => loading = false);
    }
  }
}

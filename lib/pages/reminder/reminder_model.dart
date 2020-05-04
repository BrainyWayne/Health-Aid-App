import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_aid_app/locator.dart';
import 'package:health_aid_app/models/base_model.dart';
import 'package:health_aid_app/models/reminder.dart';
import 'package:health_aid_app/services/database.dart';
import 'package:health_aid_app/services/navigation_service.dart';
import 'package:health_aid_app/shared/picker.dart';
import 'package:health_aid_app/util/flushbar.dart';
import 'package:intl/intl.dart';

class ReminderModel extends BaseModel {
  Picker picker = locator.get<Picker>();
  DatabaseService _db = locator.get<DatabaseService>();
  Toaster _toast = locator.get<Toaster>();
  NavigationService _nav = locator.get<NavigationService>();

  List reminders = [];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController timeController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  var dateformat = DateFormat.yMd();
  REMINDER reminder = REMINDER();

  bool _autoValidate = false;

  bool get autoValidate => _autoValidate;

  set autoValidate(bool autoValidate) {
    _autoValidate = autoValidate;
    notifyListeners();
  }

  ReminderModel(BuildContext context) {
    // timeController.text = TimeOfDay.now().format(context);
  }

  List<String> times = [
    'Once a day',
    'Twice a day',
    'Trice a day',
  ];
  String _selectedTime;

  String get selectedTime => _selectedTime;

  set selectedTime(String selectedTime) {
    _selectedTime = selectedTime;
    reminder.numberOfTimes = selectedTime;
    notifyListeners();
  }

  setTime(TimeOfDay time, BuildContext context) {
    timeController.text = time.format(context);
    reminder.time = time.format(context);
    notifyListeners();
  }

  setStartDate(DateTime date, BuildContext context) {
    startController.text = dateformat.format(date);
    reminder.start = Timestamp.fromDate(date);
  }

  setEndDate(DateTime date, BuildContext context) {
    endController.text = dateformat.format(date);
    reminder.end = Timestamp.fromDate(date);
  }

  saveReminder() async {
    formKey.currentState.save();
    if (reminder.start.toDate().isAfter(reminder.end.toDate())) {
      return _toast.errorToast(msg: 'Start and End dates does not match');
    }

    if (formKey.currentState.validate()) {
      await _db.createDoc2('REMINDERS', reminder.toMap());
      _toast.successToast(msg: 'Reminder Added');
      _nav.navigateBack();
    } else {
      autoValidate = true;
    }
  }

  Stream<List<REMINDER>> getReminders() {
    return _db.getReminders();
  }
}

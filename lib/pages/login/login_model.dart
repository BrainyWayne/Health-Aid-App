import 'package:flutter/material.dart';
import 'package:health_aid_app/locator.dart';
import 'package:health_aid_app/models/base_model.dart';
import 'package:health_aid_app/services/error_handler.dart';
import 'package:health_aid_app/services/firebase_auth.dart';
import 'package:health_aid_app/services/navigation_service.dart';
import 'package:health_aid_app/util/flushbar.dart';

class LoginModel extends BaseModel {
  NavigationService _nav = locator.get<NavigationService>();
  Auth _auth = locator.get<Auth>();
  HandleError _handle = locator.get<HandleError>();
  Toaster _toast = locator.get<Toaster>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _email;

  String get email => _email;

  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String _password;

  String get password => _password;

  set password(String password) {
    _password = password;
    notifyListeners();
  }

  bool _autoVaditator = false;
  bool get autoVaditator => _autoVaditator;
  set autoVaditator(bool autoVaditator) {
    _autoVaditator = autoVaditator;
    notifyListeners();
  }

  signin() {
    var _formState = formKey.currentState;
    _formState.save();
    autoVaditator = true;
    if (_formState.validate() && !loading) {
      loading = true;
      _auth.signIn(email, password).then((value) {
        _nav.moveTo('/home');
        _toast.successToast(msg: 'Welcome ');
      }).catchError((err) {
        _toast.errorToast(msg: _handle.errorCheck(err));
        print(err);
      }).whenComplete(() => loading = false);
    }
  }

  signInWithGoogle() {
    loading = true;
    if (!loading) {
      return _auth
          .googleSignIn()
          .then((value) => _nav.moveTo('/home'))
          .catchError((error) {
        Toaster().errorToast(msg: 'error');
        print(error);
      }).whenComplete(() => loading = false);
    }
  }

  signup() => _nav.navigateTo('/signup');
}

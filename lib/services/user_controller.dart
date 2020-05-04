// import 'package:flutter/cupertino.dart';
// import 'package:health_aid/locator.dart';
// import 'package:health_aid/services/database.dart';

// import 'firebase_auth.dart';

// class UserController with ChangeNotifier {
//   UserController() {
//     getCurrentUser();
//   }

//   Auth _auth = locator.get<Auth>();
//   DatabaseService _db = locator.get<DatabaseService>();

//   USER _currentUser;
//   USER get currentUser => _currentUser;

//   set currentUser(USER user) {
//     print(user.name);
//     _currentUser = user;
//     notifyListeners();
//   }

//   getCurrentUser() async {
//     var _user = await _auth.getCurrentUser();

//     if (_user != null) currentUser = await _db.getUserData(_user.uid);

//     return currentUser;
//   }
// }

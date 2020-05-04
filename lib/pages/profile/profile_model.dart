import 'package:health_aid_app/locator.dart';
import 'package:health_aid_app/models/base_model.dart';
import 'package:health_aid_app/services/firebase_auth.dart';

class ProfileModel extends BaseModel {
  Auth auth = locator.get<Auth>();

  logOut() => auth.signOut();
}

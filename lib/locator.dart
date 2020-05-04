import 'package:get_it/get_it.dart';
import 'package:health_aid_app/data/data.dart';
import 'package:health_aid_app/services/database.dart';
import 'package:health_aid_app/services/error_handler.dart';
import 'package:health_aid_app/services/firebase_auth.dart';
import 'package:health_aid_app/services/navigation_service.dart';
import 'package:health_aid_app/shared/picker.dart';
import 'package:health_aid_app/util/flushbar.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => Auth());
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => HandleError());
  locator.registerLazySingleton(() => TestData());
  locator.registerLazySingleton(() => Picker());
  locator.registerLazySingleton(() => Toaster());
  // locator.registerLazySingleton(() => UserController());
  // locator.registerLazySingleton(() => AddQuestionsModel());
}

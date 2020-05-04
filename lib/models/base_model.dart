import 'package:flutter/widgets.dart';

class BaseModel with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }
}

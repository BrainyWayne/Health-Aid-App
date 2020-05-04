import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class HandleError {
  String errorCheck(e) {
    if (kIsWeb) {
      return e.message;
    } else {
      if (Platform.isAndroid) {
        switch (e.message) {
          case 'There is no user record corresponding to this identifier. The user may have been deleted.':
            return 'There is no user record corresponding to this email';

          case 'The password is invalid or the user does not have a password.':
            return 'The password is invalid';

          case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
            return 'A network error (such as slow network, interrupted connection or unreachable host)';

          // ...
          default:
            return e.message;
        }
      } else if (Platform.isIOS) {
        switch (e.code) {
          case 'Error 17011':
            return 'There is no user record corresponding to this email';

          case 'Error 17009':
            return 'The password is invalid';

          case 'Error 17020':
            return 'A network error (such as slow network, interrupted connection or unreachable host)';

          default:
            return e.details;
        }
      }
    }

    return 'Something Bad Happend, Retry';
  }
}

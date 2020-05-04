import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_aid_app/router.dart';
import 'package:health_aid_app/services/navigation_service.dart';
import 'package:health_aid_app/util/flushbar.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        StreamProvider<FirebaseUser>.value(
          value: FirebaseAuth.instance.onAuthStateChanged,
          initialData: null,
          catchError: (_, error) {
            locator.get<Toaster>().errorToast(msg: error);
            return null;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Health Care',
        onGenerateRoute: Router.onGenerateRoutes,
        navigatorKey: locator.get<NavigationService>().navigationKey,
        // showPerformanceOverlay: true,
        initialRoute: '/',
        theme: ThemeData(
          primaryColor: Colors.greenAccent,
          textTheme: GoogleFonts.poppinsTextTheme().apply(
            bodyColor: Color.fromRGBO(29, 52, 60, 1),
            decorationColor: Color.fromRGBO(29, 52, 60, 1),
            displayColor: Color.fromRGBO(29, 52, 60, 1),
          ),
          // brightness: Brightness.dark,
          accentColor: Colors.pink[300],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:provider/provider.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    FirebaseUser _user = Provider.of<FirebaseUser>(context);
    bool loggedIn = _user != null;

    return Scaffold(
      body: Consumer<FirebaseUser>(
        builder: (context, user, widget) => Container(
          decoration: BoxDecoration(gradient: Gradients.hotLinear),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome To\n',
                        style: _theme.textTheme.caption,
                      ),
                      TextSpan(
                        text: 'Health Aid',
                        style: GoogleFonts.aladin(
                          textStyle: _theme.textTheme.headline2,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Health Care Access Made Easy 😍 🥰',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    textStyle: _theme.textTheme.caption,
                  ),
                ),
                SizedBox(height: 40),
                !loggedIn
                    ? FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        color: _theme.primaryColor,
                        child: Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                      )
                    : FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        color: _theme.primaryColor,
                        child: Text(
                          'GO TO HOME',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/home');
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

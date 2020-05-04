import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:health_aid_app/pages/login/login_model.dart';
import 'package:health_aid_app/pages/signup/signup.dart';
import 'package:health_aid_app/util/spinner.dart';
import 'package:health_aid_app/util/validators.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static final String path = "lib/src/pages/login/login7.dart";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<LoginModel>(
          builder: (context, model, chlid) => ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: WaveClipper2(),
                    child: Container(
                      child: Column(),
                      width: double.infinity,
                      height: 240,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Gradients.coldLinear.colors.first.withOpacity(0.8),
                            Gradients.coldLinear.colors.last.withOpacity(0.6),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipper3(),
                    child: Container(
                      child: Column(),
                      width: double.infinity,
                      height: 240,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Gradients.coldLinear.colors.first.withOpacity(0.5),
                            Gradients.coldLinear.colors.last.withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipper1(),
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Image.asset('assets/heart.png'),
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Gradients.coldLinear.colors.first
                                  .withOpacity(0.8),
                              Gradients.coldLinear.colors.last.withOpacity(0.7),
                            ])),
                          )
                        ],
                      ),
                      width: double.infinity,
                      height: 240,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.blue],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 60),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "health",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                            ),
                          ),
                          TextSpan(
                            text: "Aid",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Form(
                key: model.formKey,
                autovalidate: model.autoVaditator,
                child: Container(
                    padding: EdgeInsets.only(left: 45, right: 45),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          enableInteractiveSelection: true,
                          enabled: true,
                          enableSuggestions: true,
                          onSaved: (value) => model.email = value,
                          validator: Validators.validateEmail,
                          decoration:
                              buildInputDecoration(helperText: 'E-mail'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          enableInteractiveSelection: true,
                          enabled: true,
                          onSaved: (value) => model.password = value,
                          validator: Validators.validatePassword,
                          decoration:
                              buildInputDecoration(helperText: 'Password'),
                        ),
                        // SizedBox(
                        //   height: 30,
                        // ),
                        SizedBox(height: 30),
                        model.loading
                            ? Spinner()
                            : GradientButton(
                                callback: model.signin,
                                increaseWidthBy: 30,
                                increaseHeightBy: 5,
                                shapeRadius: BorderRadius.circular(10),
                                child: Text(
                                  "SIGN IN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                        SizedBox(height: 20),

                        FlatButton(
                          onPressed: model.signInWithGoogle,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                EvaIcons.google,
                                color: Color.fromRGBO(234, 67, 53, 1),
                              ),
                              SizedBox(width: 10),
                              Text('Continue With Google'),
                            ],
                          ),
                        ),

                        FlatButton(
                          onPressed: model.signup,
                          child: Text(
                            "Create new account",
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({
    String hintText,
    String helperText,
  }) {
    return InputDecoration(
      hintText: hintText,
      helperText: helperText,
      labelText: hintText,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintStyle: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
    );
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

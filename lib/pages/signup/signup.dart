import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:health_aid_app/pages/signup/signup_model.dart';
import 'package:health_aid_app/util/validators.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  static final String path = "lib/src/pages/login/login7.dart";
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return ChangeNotifierProvider(
      create: (context) => SignupModel(),
      child: Consumer<SignupModel>(
        builder: (context, model, child) => Scaffold(
          body: ListView(
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

              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.only(left: 45, right: 45, bottom: 45),
                  child: Form(
                    autovalidate: model.autoValidate,
                    key: model.formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              buildInputDecoration(hintText: 'Full Name'),
                          validator: Validators.validateUserName,
                          onSaved: (value) => model.user.name = value,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: buildInputDecoration(hintText: 'Email'),
                          validator: Validators.validateEmail,
                          onSaved: (v) => model.user.email = v,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DropdownButtonFormField<String>(
                            value: model.sex,
                            onSaved: (v) => model.user.gender = v,
                            validator: Validators.validateNull,
                            decoration: buildInputDecoration(
                              hintText: 'Select Sex',
                            ),
                            items: model.sexs
                                .map(
                                  (k) => DropdownMenuItem<String>(
                                    child: Text(k),
                                    value: k,
                                  ),
                                )
                                .toList(),
                            onChanged: (value) => model.selectedSex = value),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: model.dateController,
                          validator: Validators.validateNull,
                          onTap: () async {
                            var date = await model.picker.pickDate(context);

                            model.setDate(date, context);
                          },
                          decoration:
                              buildInputDecoration(hintText: 'Date of Birth'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: model.passwordController,
                          decoration:
                              buildInputDecoration(hintText: 'Password'),
                          validator: Validators.validatePassword,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: buildInputDecoration(
                              hintText: 'Confirm Password'),
                          validator: (value) {
                            if (model.passwordController.text != value) {
                              return 'Password does not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: buildInputDecoration(
                              hintText: 'Special conditions'),
                          validator: Validators.validateNull,
                          onSaved: (value) =>
                              model.user.specialConditions = value,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: model.agreedTerms,
                          onChanged: (value) => model.agreedTerms = value,
                          title: Text('Agree To Terms and Conditions'),
                        ),
                        SizedBox(height: 20),
                        GradientButton(
                          callback: model.signUp,
                          increaseHeightBy: 10,
                          increaseWidthBy: 50,
                          shapeRadius: BorderRadius.circular(15),
                          child: Text('SIGN UP'),
                        ),
                        SizedBox(height: 20),
                        FlatButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            "I am already a member",
                            style: TextStyle(
                              color: _theme.accentColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({
    @required String hintText,
    String helperText,
  }) {
    return InputDecoration(
      hintText: hintText,
      helperText: helperText,
      hintStyle: TextStyle(
        color: Colors.blue,
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

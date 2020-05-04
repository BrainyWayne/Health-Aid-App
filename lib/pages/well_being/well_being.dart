import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_aid_app/pages/well_being/well_being_model.dart';
import 'package:health_aid_app/util/back_button.dart';
import 'package:provider/provider.dart';

class WellBeing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    Size _size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<WellBeingModel>(
      create: (context) => WellBeingModel(),
      child: Consumer<WellBeingModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: _theme.scaffoldBackgroundColor,
            leading: KBackButton(
              color: Colors.black,
            ),
            centerTitle: true,
            // title: Text('Check Your Well being'),
            actions: <Widget>[
              KNotification(
                color: Colors.pink,
              )
            ],
          ),
          body: Container(
            width: _size.width,
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  // controller: controller,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        // padding: EdgeInsets.all(20),
                        child: Text(
                          'Check your\nwell-being',
                          textAlign: TextAlign.center,
                          style: _theme.textTheme.headline4.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Text(
                          'We\'re sure that deciding to check an your health is a big step, even if it does\'t border in any way. let\'s start with a general body condition test',
                          textAlign: TextAlign.center,
                          style: _theme.textTheme.bodyText1.copyWith(
                            height: 1.5,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      FlatButton(
                        color: _theme.primaryColor,
                        textTheme: _theme.buttonTheme.textTheme,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        onPressed: () => openDialog(context),
                        child: Text('Start General Test'),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '500+',
                                    style: _theme.textTheme.headline5.copyWith(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  TextSpan(
                                      text: '\nScientifically\nbased test',
                                      style: _theme.textTheme.bodyText1)
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '2000+',
                                    style: _theme.textTheme.headline5.copyWith(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  TextSpan(
                                      text: '\nmedical\nrecommendations',
                                      style: _theme.textTheme.bodyText1)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Powered by ML-Kit by Google',
                      style: _theme.textTheme.caption,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  openDialog(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    FirebaseUser _user = Provider.of<FirebaseUser>(context, listen: false);
    WellBeingModel _model = Provider.of<WellBeingModel>(context, listen: false);

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'This Feature will be available soon',
                textAlign: TextAlign.center,
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'This feature is powered by AI to analyse your respose, and tell you the disease you a suffering from. To know when its available subscribe:',
                        textAlign: TextAlign.center,
                        style: _theme.textTheme.bodyText1.copyWith(
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        'How It Works',
                        textAlign: TextAlign.left,
                        style: _theme.textTheme.bodyText2
                            .copyWith(height: 1.5, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '1. Shows the risk of diesase.',
                        textAlign: TextAlign.left,
                        style: _theme.textTheme.caption,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '2. Give personalized prevention recommendations',
                        textAlign: TextAlign.left,
                        style: _theme.textTheme.caption,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '3. Give prescriptions to take',
                        textAlign: TextAlign.left,
                        style: _theme.textTheme.caption,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: TextField(
                        controller: _model.controller,
                        decoration: InputDecoration(
                          hintText: 'Enter Email',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _model.sendFeedback(_user);
                  },
                  child: Text('OK'),
                )
              ],
            ));
  }
}
